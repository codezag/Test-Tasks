# BetterUp Logging Buckets

This module provisions S3 buckets used for collecting logs from CloudTrail and VPC Flow Logs across multiple AWS accounts. Buckets are created in a centralized Log Archive account within `us-east-1` and `eu-central-1` regions.



## Setup Instructions

1. Define `locals.tf`  
   - Dynamically loop over log services (`cloudtrail`, `vpcflowlogs`)  
   - Generate bucket names using `${var.prefix}-logs-${svc}`

2. Create `main.tf`  
   - Use BetterUp’s shared S3 module from Spacelift  
   - Configure lifecycle expiration (365 days)  

3. Define variables in `variables.tf`  
   - `prefix`  
   - `region`  
   - `services`

4. Provide region and service values in `terraform.tfvars`  
   - Example: `prefix = "bu-eu"`

5. Define `providers.tf`  
   - Set AWS region and alias for deployment



## Resources Created

- One S3 bucket per service and region (e.g., `bu-us-logs-cloudtrail`)
- Lifecycle policy to delete logs after 365 days



## Resource Naming Convention
**Example:**
- `bu-us-logs-cloudtrail`
- `bu-eu-logs-vpcflowlogs`



## Maintainers

- InfoSec Team — [security@betterup.co](mailto:security@betterup.co)
