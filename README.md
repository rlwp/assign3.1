# assign3.1-workflow
For activity to do workflow via github

Terraform AWS Infrastructure with GitHub Actions CI/CD
This repository demonstrates infrastructure as code (IaC) using Terraform to provision AWS resources with automated CI/CD workflows using GitHub Actions.

Infrastructure Overview
This project provisions the following AWS resources:

S3 Bucket with versioning and encryption enabled
VPC with proper DNS configuration
Public Subnet with internet access
Internet Gateway for public access
Route Tables for network traffic control
GitHub Actions Workflows
Terraform Apply Workflow (.github/workflows/terraform-apply.yaml)
This workflow handles the planning and provisioning of infrastructure:

Trigger on Pull Request: Runs terraform plan to validate changes and comments the plan on the PR
Trigger on Push to Main: After PR approval and merge, automatically applies the infrastructure changes
Terraform Destroy Workflow (.github/workflows/terraform-destroy.yaml)
This workflow handles the destruction of infrastructure:

Manual Trigger Only: Runs only when manually invoked with required confirmation
Safety Confirmation: Requires typing "DESTROY" to confirm infrastructure deletion
Environment Selection: Allows selecting which environment to destroy
Prerequisites
AWS Account with appropriate permissions
GitHub repository with Actions enabled
AWS credentials configured as GitHub Secrets:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
Getting Started
Clone this repository:

git clone https://github.com/azniosman/Assignment-3.1.git
cd Assignment-3.1
Configure AWS Credentials:

Add AWS credentials as secrets in your GitHub repository settings
Customize Variables:

Copy terraform.tfvars.example to terraform.tfvars
Modify the variables according to your requirements
Initial Deployment:

Create a feature branch
Make your changes
Push and create a Pull Request
Review the plan in the PR comments
Merge to main to apply changes
Configuration
Terraform Variables
Key variables that can be configured (see variables.tf for details):

project_name: Name of your project
environment: Deployment environment (development, staging, production)
bucket_name_prefix: Prefix for S3 bucket names
vpc_cidr_block: CIDR block for the VPC network
public_subnet_cidr: CIDR block for the public subnet
GitHub Actions Secrets
Required GitHub secrets:

AWS_ACCESS_KEY_ID: AWS access key ID
AWS_SECRET_ACCESS_KEY: AWS secret access key
Security Considerations
For production use, consider using AWS OIDC instead of long-lived access keys
The S3 bucket is configured with server-side encryption by default
Infrastructure is tagged properly for resource tracking and cost allocation
Best Practices
This repository demonstrates several IaC best practices:

Infrastructure as Code: All infrastructure defined as code in Terraform
CI/CD Automation: Automated testing and deployment via GitHub Actions
Plan Before Apply: Review changes in PRs before they're applied
Environment Isolation: Configure different environments with variables
Version Control: All configurations stored in version control
