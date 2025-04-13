# AWS Terraform Infrastructure - Provider Configuration
#
# License: MIT
#
# This file configures the AWS provider with region, profile, and default tags.
# Default tags ensure consistent resource tagging throughout the infrastructure.

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region

  # Optional profile configuration
  profile = var.aws_profile

  # Default tags applied to all resources
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

# Variables for provider configuration
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile to use (optional)"
  type        = string
  default     = null
} 