
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.15"
    }
  }
  required_version = "1.5.7"
}

provider "aws" {
  region = var.region
   #profile = "default"

  default_tags {
    tags = {
      owner         = "InfoSec"
      project       = "infrastructure"
      environment   = var.environment
      businessUnit  = "engineering"
      sensitiveData = "TLP:RED"
    }
  }
}





