variable "prefix" {
  description = "Prefix for bucket names, e.g., bu-eu"
  type        = string
}

variable "region" {
  description = "AWS region to deploy to"
  type        = string
}

variable "environment" {
  description = "Environment name like dev, staging, or prod"
  type        = string
}

variable "services" {
  description = "Name of the logging service"
  type        = list(string)
}
