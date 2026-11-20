variable "aws_region" {
  description = "AWS region where infrastructure would be deployed."
  type        = string
  default     = "ap-south-1"
}

variable "bucket_prefix" {
  description = "Prefix used to generate a globally unique S3 bucket name."
  type        = string
  default     = "project-7-ci-"
}
