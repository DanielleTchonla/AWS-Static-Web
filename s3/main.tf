
resource "aws_s3_bucket" "bucketfelixstatichost5648" {
  bucket = "bucketfelixstatichost5648"
}

resource "aws_s3_bucket_ownership_controls" "s3ownership" {
  bucket = aws_s3_bucket.bucketfelixstatichost5648.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "pab" {
  bucket = aws_s3_bucket.bucketfelixstatichost5648.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3ownership,
    aws_s3_bucket_public_access_block.pab,
  ]

  bucket = aws_s3_bucket.bucketfelixstatichost5648.id
  acl    = "public-read"
}

