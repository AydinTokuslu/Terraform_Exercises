resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucketName

}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "index.html"
  source = "C:/Users/aydin/Desktop/my-projects/aws/Project-006-kittens-carousel-static-web-s3-cf/static-web/index.html"
  acl = "public-read"

}

resource "aws_s3_object" "object1" {
  for_each = fileset("C:/Users/aydin/Desktop/my-projects/aws/Project-006-kittens-carousel-static-web-s3-cf/static-web/", "*")
  bucket   = aws_s3_bucket.website_bucket.id
  key      = each.value
  source   = "C:/Users/aydin/Desktop/my-projects/aws/Project-006-kittens-carousel-static-web-s3-cf/static-web/${each.value}"
  etag     = filemd5("C:/Users/aydin/Desktop/my-projects/aws/Project-006-kittens-carousel-static-web-s3-cf/static-web/${each.value}")
}

resource "aws_s3_bucket_policy" "b3" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = <<POLICY
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "AllowPublicRead",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.website_bucket.bucket}/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }
}


