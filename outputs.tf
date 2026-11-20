output "example_bucket_name" {
  description = "Name generated for the example S3 bucket when Terraform is applied."
  value       = aws_s3_bucket.ci_example.bucket
}
