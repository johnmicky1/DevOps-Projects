terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {

  region = "us-east-1"
}

# Define an AWS S3 bucket resource
resource "aws_s3_bucket" "example" {
  # Specify the name of the S3 bucket
  bucket = "johnmike-2025-project-bucket01"
  
  # Enable force destroy to delete the bucket even if it's not empty
  force_destroy = true
  
  # Enable versioning for the S3 bucket
  versioning {
    enabled = true
  }
  
  # Add tags to the S3 bucket for organization and filtering
  tags = {
    # Name tag for the bucket
    Name = "johnmike-2025-project-bucket01"
    # Environment tag for the bucket (e.g., Dev, Prod)
    Environment = "Dev"
  }
}

# Define an AWS S3 bucket versioning resource (not necessary in this case)
# Since versioning is already enabled in the aws_s3_bucket resource
resource "aws_s3_bucket_versioning" "example" {
  # Specify the ID of the S3 bucket
  bucket = aws_s3_bucket.example.id
  
  # Configure the versioning status
  versioning_configuration {
    # Enable versioning for the bucket
    status = "Enabled"
  }
}

