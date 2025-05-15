## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.15 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.read_only_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.read_write_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_kms_key.encryption_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.bucket_lifecycle_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_ownership_controls.ownership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.bucket_access_control](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bucket_sse_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_iam_policy_document.decrypt_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.list_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.read_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.read_only_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.read_write_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.write_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Prevents any new ACLs to be created or existing ACLs being modified which enable public access to the object. With this alone existing ACLs will not be affected. | `bool` | `false` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Prevents a bucket policy containing public actions from being created or modified on an S3 bucket, the bucket itself will still allow the existing policy. | `bool` | `false` | no |
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | ACL to apply to the bucket | `string` | `null` | no |
| <a name="input_bucket_key_enabled"></a> [bucket\_key\_enabled](#input\_bucket\_key\_enabled) | Should the bucket key be enabled | `bool` | `true` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name | `string` | n/a | yes |
| <a name="input_bucket_ownership_policy"></a> [bucket\_ownership\_policy](#input\_bucket\_ownership\_policy) | Bucket ownership policy. One of BucketOwnerEnforced, BucketOwnerPreferred or ObjectWriter | `string` | `"BucketOwnerPreferred"` | no |
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | Create a custom KMS key to encrypt the bucket contents | `bool` | `true` | no |
| <a name="input_create_read_only_policy"></a> [create\_read\_only\_policy](#input\_create\_read\_only\_policy) | Create a read only policy | `bool` | `true` | no |
| <a name="input_create_read_write_policy"></a> [create\_read\_write\_policy](#input\_create\_read\_write\_policy) | Create a read/write policy | `bool` | `true` | no |
| <a name="input_enable_server_side_encryption"></a> [enable\_server\_side\_encryption](#input\_enable\_server\_side\_encryption) | Use a custom KMS key to encrypt the bucket contents | `bool` | `true` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | Should the bucket store previous versions of the objects | `bool` | `false` | no |
| <a name="input_expiration_days"></a> [expiration\_days](#input\_expiration\_days) | How many days should an object stay in the bucket. Set to -1 to disable | `number` | `-1` | no |
| <a name="input_expiration_days_for_old_versions"></a> [expiration\_days\_for\_old\_versions](#input\_expiration\_days\_for\_old\_versions) | How many days should old versions be kept in the bucket. Set to -1 to disable. | `number` | `-1` | no |
| <a name="input_extra_permissions_bucket"></a> [extra\_permissions\_bucket](#input\_extra\_permissions\_bucket) | Extra permissions to add to the top level bucket object | `list(string)` | `[]` | no |
| <a name="input_extra_permissions_read_only"></a> [extra\_permissions\_read\_only](#input\_extra\_permissions\_read\_only) | Extra permissions to add to the read only policy | `list(string)` | `[]` | no |
| <a name="input_extra_permissions_read_write"></a> [extra\_permissions\_read\_write](#input\_extra\_permissions\_read\_write) | Extra permissions to add to the read/write policy | `list(string)` | `[]` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Any ACLs actions that exist with public access will be ignored, this does not prevent them being created but prevents their effects. | `bool` | `false` | no |
| <a name="input_kms_multi_region_enabled"></a> [kms\_multi\_region\_enabled](#input\_kms\_multi\_region\_enabled) | Should the kms key used to encrypt the bucket be multi-region. | `bool` | `false` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Prevent non AWS services or authorized users (such as an IAM user or role) from being able to publicly access objects in the bucket. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the bucket | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the bucket |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The whole bucket object |
| <a name="output_encryption_key"></a> [encryption\_key](#output\_encryption\_key) | Key used to encrypt the bucket |
| <a name="output_name"></a> [name](#output\_name) | The name of the bucket |
| <a name="output_read_only_policy"></a> [read\_only\_policy](#output\_read\_only\_policy) | Read only policy to access the bucket |
| <a name="output_read_write_policy"></a> [read\_write\_policy](#output\_read\_write\_policy) | Read/Write policy to access the bucket |
| <a name="output_read_write_policy_document"></a> [read\_write\_policy\_document](#output\_read\_write\_policy\_document) | Read/Write policy document to access the bucket |
