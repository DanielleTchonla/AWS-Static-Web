
# Creating our S3 bucket
resource "aws_s3_bucket" "bucketfelixstatichost5648" {
  bucket = "bucketfelixstatichost5648"
}

# Configuring bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "s3ownership" {
  bucket = aws_s3_bucket.bucketfelixstatichost5648.id
  rule {
    object_ownership = "BucketOwnerPreferred"  # Indicates that the bucket owner should have preferred ownership of objects
  }
}

# Configuring public access block settings for the bucket
resource "aws_s3_bucket_public_access_block" "pab" {
  bucket = aws_s3_bucket.bucketfelixstatichost5648.id

  block_public_acls       = false  # Disables blocking public ACLs
  block_public_policy     = false  # Disables blocking public policies
  ignore_public_acls      = false  # Does not ignore public ACLs
  restrict_public_buckets = false  # Does not restrict public buckets
}

# Setting ACL for the bucket to allow public read access
resource "aws_s3_bucket_acl" "s3acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3ownership,
    aws_s3_bucket_public_access_block.pab,
  ]

  bucket = aws_s3_bucket.bucketfelixstatichost5648.id
  acl    = "public-read"  # Sets ACL to allow public read access
}

# Configuring S3 bucket website hosting
resource "aws_s3_bucket_website_configuration" "static_web" {
    bucket = aws_s3_bucket.bucketfelixstatichost5648.id

  index_document {
    suffix = "index.html"  # Specifies the index document
  }

  error_document {
    key = "error.html"  # Specifies the error document
  }
}

# Uploading index.html to the S3 bucket and setting ACL to public-read
resource "aws_s3_object" "index_file" {
  key          = "index.html"
  bucket       = aws_s3_bucket.bucketfelixstatichost5648.id
  source       = "${path.module}/index.html"
  content_type = "text/html"
#   acl          = "public-read"  # Sets ACL to public-read
}

# Uploading error.html to the S3 bucket and setting ACL to public-read
resource "aws_s3_object" "error_file" {
  key          = "error.html"
  bucket       = aws_s3_bucket.bucketfelixstatichost5648.id
  source       = "${path.module}/error.html"
  content_type = "text/html"
#   acl          = "public-read"  # Sets ACL to public-read
}

# Creating CloudFront distribution to serve the static website content
resource "aws_cloudfront_distribution" "cloudfront" {
  depends_on = [ aws_s3_bucket.bucketfelixstatichost5648 ]

  origin {
    domain_name = aws_s3_bucket.bucketfelixstatichost5648.bucket_regional_domain_name
    origin_id   = var.cloudfront_origin_id  # Specifies the origin ID
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = var.cloudfront_origin_id 

    viewer_protocol_policy = "redirect-to-https"  # Redirects HTTP to HTTPS
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]

    min_ttl             = 0
    default_ttl         = 3600
    max_ttl             = 86400

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true  # Uses the CloudFront default SSL certificate
  }
}
