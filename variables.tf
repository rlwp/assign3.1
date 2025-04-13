####################################
# Terraform Variable Definitions
####################################

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "rudy-workflow"
}

variable "environment" {
  description = "Deployment environment (development, staging, production)"
  type        = string
  default     = "development"
}

variable "bucket_name_prefix" {
  description = "Prefix for S3 bucket names"
  type        = string
  default     = "rudy-workflow"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# AWS Region - from provider.tf
# Included here for documentation, but defined in provider.tf
# variable "aws_region" {
#   description = "AWS region to deploy resources"
#   type        = string
#   default     = "us-east-1"
# } 