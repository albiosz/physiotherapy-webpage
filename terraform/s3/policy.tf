resource "aws_s3_bucket_public_access_block" "allow_public_access" {
  bucket                  = aws_s3_bucket.hubertszulc_eu.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


data "aws_iam_policy_document" "allow_public_access" {
  statement {
    sid    = "AllowPublicRead"
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    actions = ["S3:GetObject"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.hubertszulc_eu.id
  policy = data.aws_iam_policy_document.allow_public_access.json

  depends_on = [aws_s3_bucket_public_access_block.allow_public_access]
}

