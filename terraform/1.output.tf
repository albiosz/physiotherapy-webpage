output "s3_website_endpoint" {
  value = module.s3.website_url
}

output "cloudfront_distribution_domain_name" {
  value = module.cloudfront.domain_name
}
