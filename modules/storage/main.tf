resource "aws_s3_bucket" "insecure-bucket" {
  bucket = "insecure-bucket"
  versioning = true
}

resource "aws_s3_bucket_logging" "insecure-bucket" {
  bucket = aws_s3_bucket.example.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "insecure-bucket" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
    mfa_delete = "Enabled"
  }
}

# resource "aws_s3_bucket_public_access_block" "insecure-bucket" {
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 20
  encrypted         = true
  tags = {
    Name = "insecure"
  }
}
