

output "aws_s3_bucket_website_configuration" {
    value = aws_s3_bucket_website_configuration.static_web
    description = "The website configuration for this bucket."
}

output "aws_cloudfront_distribution" {
    value = aws_cloudfront_distribution.cloudfront
    description = "The cloudfront distribution for this bucket."
}



//"website_endpoint" = "bucketfelixstatichost5648.s3-website-us-east-1.amazonaws.com"
  
