variable "block_public_acls" {
  description = "Prevents any new ACLs to be created or existing ACLs being modified which enable public access to the object. With this alone existing ACLs will not be affected."
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Prevents a bucket policy containing public actions from being created or modified on an S3 bucket, the bucket itself will still allow the existing policy."
  type        = bool
  default     = false
}

variable "bucket_acl" {
  description = "ACL to apply to the bucket"
  type        = string
  default     = null
}

variable "bucket_key_enabled" {
  description = "Should the bucket key be enabled"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "bucket_ownership_policy" {
  description = "Bucket ownership policy. One of BucketOwnerEnforced, BucketOwnerPreferred or ObjectWriter"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "create_kms_key" {
  description = "Create a custom KMS key to encrypt the bucket contents"
  type        = bool
  default     = true
}

variable "create_read_only_policy" {
  description = "Create a read only policy"
  type        = bool
  default     = true
}

variable "create_read_write_policy" {
  description = "Create a read/write policy"
  type        = bool
  default     = true
}

variable "enable_server_side_encryption" {
  description = "Use a custom KMS key to encrypt the bucket contents"
  type        = bool
  default     = true
}

variable "enable_versioning" {
  description = "Should the bucket store previous versions of the objects"
  type        = bool
  default     = false
}

variable "expiration_days" {
  description = "How many days should an object stay in the bucket. Set to -1 to disable"
  type        = number
  default     = -1
}

variable "expiration_days_for_old_versions" {
  description = "How many days should old versions be kept in the bucket. Set to -1 to disable."
  type        = number
  default     = -1
}

variable "extra_permissions_bucket" {
  description = "Extra permissions to add to the top level bucket object"
  type        = list(string)
  default     = []
}

variable "extra_permissions_read_only" {
  description = "Extra permissions to add to the read only policy"
  type        = list(string)
  default     = []
}

variable "extra_permissions_read_write" {
  description = "Extra permissions to add to the read/write policy"
  type        = list(string)
  default     = []
}

variable "ignore_public_acls" {
  description = "Any ACLs actions that exist with public access will be ignored, this does not prevent them being created but prevents their effects."
  type        = bool
  default     = false
}

variable "kms_multi_region_enabled" {
  description = "Should the kms key used to encrypt the bucket be multi-region."
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Prevent non AWS services or authorized users (such as an IAM user or role) from being able to publicly access objects in the bucket."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to the bucket"
  type        = map(string)
  default     = {}
}
