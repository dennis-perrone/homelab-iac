variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-2"
}

variable "state_bucket_name" {
  description = "Name of the Terraform state S3 bucket"
  type        = string
}

# variable "environment" {
#   type        = string
#   description = "Environment name"

#   validation {
#     condition     = contains(["dev", "staging", "prod"], var.environment)
#     error_message = "Environment must be dev, staging, or prod."
#   }
# }