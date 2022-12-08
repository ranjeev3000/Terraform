# Create s3 Bucket

resource "aws_s3_bucket" "levelup_s3bucket" {
  bucket = "levelup-bucket-69"

  tags = {
    Name        = "levelup-bucket-69"
  }
}

resource "aws_s3_bucket_acl" "levelup_s3bucket_acl" {
  bucket = aws_s3_bucket.levelup_s3bucket.id
  acl    = "private"
}