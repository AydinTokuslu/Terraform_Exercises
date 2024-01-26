output "website_bucket_name" {
  value = "http://${aws_s3_bucket.website_bucket.id}.s3-website-us-east-1.amazonaws.com"
}

