resource "aws_kms_key" "encryption_kms_key" {
  count                   = var.create_kms_key ? 1 : 0
  description             = "Key used to encrypt ${var.bucket_name}"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  multi_region            = var.kms_multi_region_enabled
}

resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  tags          = var.tags
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = var.bucket_ownership_policy
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_sse_config" {
  count  = var.enable_server_side_encryption ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.create_kms_key ? aws_kms_key.encryption_kms_key[0].arn : null
      sse_algorithm     = var.create_kms_key ? "aws:kms" : "AES256"
    }
    bucket_key_enabled = var.bucket_key_enabled
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle_rules" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    status = var.expiration_days != -1 ? "Enabled" : "Disabled"

    id = "${aws_s3_bucket.bucket.id}-expire-after-${var.expiration_days}-days"
    
    expiration {
      days = var.expiration_days == -1 ? 0 : var.expiration_days
    }
  }
  rule {
    status = (var.enable_versioning && var.expiration_days_for_old_versions != -1) ? "Enabled" : "Disabled"
    id     = "${aws_s3_bucket.bucket.id}-version-expiration"
    noncurrent_version_transition {
      noncurrent_days = var.expiration_days_for_old_versions == -1 ? 30 : var.expiration_days_for_old_versions
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = var.expiration_days_for_old_versions == -1 ? 60 : var.expiration_days_for_old_versions * 2
      storage_class   = "GLACIER"
    }

    noncurrent_version_expiration {
      noncurrent_days = var.expiration_days_for_old_versions == -1 ? 90 : var.expiration_days_for_old_versions * 3
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_access_control" {
  count  = (var.block_public_acls || var.block_public_policy || var.ignore_public_acls || var.restrict_public_buckets) ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  count  = var.bucket_acl != null ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  acl    = var.bucket_acl
}
