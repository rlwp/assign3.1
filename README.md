# assign3.1-workflow
For activity to do workflow via github

<h2>Terraform AWS Infrastructure with GitHub Actions CI/CD</h2>
This repository demonstrates infrastructure as code (IaC) using Terraform to provision AWS resources with automated CI/CD workflows using GitHub Actions.

<h2>Infrastructure Overview</h2>

This project provisions the following AWS resources:

**S3 Bucket** with versioning and encryption enabled <br>
**VPC** with proper DNS configuration <br>
**Public Subnet** with internet access <br>
**Internet Gateway** for public access <br>
**Route Tables** for network traffic control <br>

<h2>GitHub Actions Workflows </h2>
_Terraform Apply Workflow (.github/workflows/terraform-apply.yaml) <br><br>_

This workflow handles the planning and provisioning of infrastructure: <br>
<b>Trigger on Pull Request:</b> Runs terraform plan to validate changes and comments the plan on the PR <br>
<b>Trigger on Push to Main:</b> After PR approval and merge, automatically applies the infrastructure changes <br>

_Terraform Destroy Workflow (.github/workflows/terraform-destroy.yaml) <br><br>_

This workflow handles the destruction of infrastructure: <br>
<b>Manual Trigger Only:</b> Runs only when manually invoked with required confirmation
<b>Safety Confirmation:</b> Requires typing "DESTROY" to confirm infrastructure deletion
<b>Environment Selection:</b> Allows selecting which environment to destroy

<br>
Prerequisites<br>
AWS Account with appropriate permissions <br>
GitHub repository with Actions enabled <br>
AWS credentials configured as GitHub Secrets: <br>
`AWS_ACCESS_KEY_ID` <br>
`AWS_SECRET_ACCESS_KEY` <br>

<br>
Getting Started <br>
Clone this repository: <br>
---
git clone https://github.com/rlwp/assign3.1.git 
cd Assign3.1

<br>
Configure AWS Credentials:

Add AWS credentials as secrets in your GitHub repository settings
<br>
Customize Variables:
<br>
Copy terraform.tfvars.example to terraform.tfvars <br>
Modify the variables according to your requirements <br>
Initial Deployment:<br>

Create a feature branch<br>
Make your changes<br>
Push and create a Pull Request<br>
Review the plan in the PR comments<br>
Merge to main to apply changes<br>
Configuration<br>
Terraform Variables<br>
Key variables that can be configured (see variables.tf for details):<br>

`project_name:` Name of your project <br>
`environment:` Deployment environment (development, staging, production) <br>
`bucket_name_prefix:` Prefix for S3 bucket names <br>
`vpc_cidr_block:` CIDR block for the VPC network <br>
`public_subnet_cidr:` CIDR block for the public subnet <br>

GitHub Actions Secrets<br>
Required GitHub secrets:<br>

`AWS_ACCESS_KEY_ID:` AWS access key ID <br>
`AWS_SECRET_ACCESS_KEY:` AWS secret access key<br>
<h2> Security Considerations </h2>
For production use, consider using AWS OIDC instead of long-lived access keys <br>
The S3 bucket is configured with server-side encryption by default <br>
Infrastructure is tagged properly for resource tracking and cost allocation <br>

<h2> Best Practices </h2>
This repository demonstrates several IaC best practices: <br>

**Infrastructure as Code:** All infrastructure defined as code in Terraform <br>
**CI/CD Automation:** Automated testing and deployment via GitHub Actions <br>
**Plan Before Apply:** Review changes in PRs before they're applied <br>
**Environment Isolation:** Configure different environments with variables <br>
**Version Control:** All configurations stored in version control <br>
