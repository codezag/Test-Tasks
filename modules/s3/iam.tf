data "aws_iam_policy_document" "decrypt_bucket" {
  statement {
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = var.create_kms_key ? [aws_kms_key.encryption_kms_key[0].arn] : []
  }
}

data "aws_iam_policy_document" "list_bucket" {
  statement {
    actions   = concat(["s3:ListBucket"], var.extra_permissions_bucket)
    resources = [aws_s3_bucket.bucket.arn]
  }
}

data "aws_iam_policy_document" "read_bucket" {
  statement {
    actions   = concat(["s3:GetObject"], var.extra_permissions_read_only)
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
  }
}

data "aws_iam_policy_document" "write_bucket" {
  statement {
    actions = concat([
      "s3:PutObject",
      "s3:DeleteObject"
    ], var.extra_permissions_read_write)
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
  }
}

data "aws_iam_policy_document" "read_only_access" {
  source_policy_documents = [
    data.aws_iam_policy_document.decrypt_bucket.json,
    data.aws_iam_policy_document.list_bucket.json,
    data.aws_iam_policy_document.read_bucket.json
  ]
}

data "aws_iam_policy_document" "read_write_access" {
  source_policy_documents = [
    data.aws_iam_policy_document.decrypt_bucket.json,
    data.aws_iam_policy_document.list_bucket.json,
    data.aws_iam_policy_document.read_bucket.json,
    data.aws_iam_policy_document.write_bucket.json
  ]
}

resource "aws_iam_policy" "read_only_policy" {
  count       = var.create_read_only_policy ? 1 : 0
  name        = "${var.bucket_name}_read_only"
  description = "Read only policy to access ${var.bucket_name}'s contents"
  policy      = data.aws_iam_policy_document.read_only_access.json
}

resource "aws_iam_policy" "read_write_policy" {
  count       = var.create_read_write_policy ? 1 : 0
  name        = "${var.bucket_name}_read_write"
  description = "Read/Write policy to access ${var.bucket_name}'s contents"
  policy      = data.aws_iam_policy_document.read_write_access.json
}
