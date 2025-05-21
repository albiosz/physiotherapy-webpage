resource "aws_s3_bucket" "hubertszulc_eu" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_name
  }
}

