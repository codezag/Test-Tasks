module "bu_log_bucket" {
  for_each = local.buckets

  source  = "../../../../../modules/s3"

  bucket_name                   = each.value.name
  enable_versioning             = false
  enable_server_side_encryption = false
  create_kms_key                = false
  expiration_days               = 365
  bucket_key_enabled            = false

  tags = {
    Service     = each.value.tag
    Environment = var.environment
  }
}
