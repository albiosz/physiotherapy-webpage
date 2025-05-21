
resource "aws_s3_bucket_website_configuration" "hubertszulc_eu" {
  bucket = aws_s3_bucket.hubertszulc_eu.id

  index_document {
    suffix = "index.html"
  }
}

