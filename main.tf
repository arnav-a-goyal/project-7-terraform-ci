terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "ci_example" {
  bucket_prefix = var.bucket_prefix

  tags = {
    Project   = "project-7-terraform-ci"
    ManagedBy = "Terraform"
  }
}
