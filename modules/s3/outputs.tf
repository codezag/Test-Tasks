output "arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket" {
  description = "The whole bucket object"
  value       = aws_s3_bucket.bucket
}

output "encryption_key" {
  description = "Key used to encrypt the bucket"
  value       = aws_kms_key.encryption_kms_key
}

output "name" {
  description = "The name of the bucket"
  value       = var.bucket_name
}

output "read_only_policy" {
  description = "Read only policy to access the bucket"
  value       = aws_iam_policy.read_only_policy
}

output "read_write_policy" {
  description = "Read/Write policy to access the bucket"
  value       = aws_iam_policy.read_write_policy
}

output "read_write_policy_document" {
  description = "Read/Write policy document to access the bucket"
  value       = data.aws_iam_policy_document.read_write_access
}
