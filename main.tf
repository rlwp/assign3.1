####################################
# AWS Infrastructure Example
####################################

# S3 Bucket with versioning enabled
resource "aws_s3_bucket" "app_data" {
  bucket = "${var.bucket_name_prefix}-${var.environment}-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.project_name}-app-data"
    Description = "Application data storage bucket"
  }
}

# Random ID for unique bucket naming
resource "random_id" "suffix" {
  byte_length = 4
}

# Enable versioning on the bucket
resource "aws_s3_bucket_versioning" "app_data_versioning" {
  bucket = aws_s3_bucket.app_data.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# Set bucket server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "app_data_encryption" {
  bucket = aws_s3_bucket.app_data.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Simple VPC Configuration
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# Public subnet for the VPC
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"
  
  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet"
  }
}

# Internet Gateway for the VPC
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
  tags = {
    Name = "${var.project_name}-${var.environment}-public-rt"
  }
}

# Associate route table with public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
} 