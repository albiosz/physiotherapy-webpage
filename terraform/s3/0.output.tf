output "website_url" {
  value = aws_s3_bucket_website_configuration.hubertszulc_eu.website_endpoint
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.hubertszulc_eu.bucket_regional_domain_name
}
