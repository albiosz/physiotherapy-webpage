terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  alias      = "us_east_1"
}


module "s3" {
  source = "./s3"

  domain_name = var.domain_name
  bucket_name = var.bucket_name
}

resource "aws_acm_certificate" "hubertszulc_eu" {
  domain_name               = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  provider = aws.us_east_1
}

module "route53" {
  source = "./route53"

  domain_name = var.domain_name

  acm_certificate_domain_validation_options = aws_acm_certificate.hubertszulc_eu.domain_validation_options
  acm_certificate_arn                       = aws_acm_certificate.hubertszulc_eu.arn

  providers = {
    aws.eu_central_1 = aws
    aws.us_east_1    = aws.us_east_1
  }
}

module "cloudfront" {
  source = "./cloudfront"

  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  certificate_arn             = aws_acm_certificate.hubertszulc_eu.arn
  website_url                 = module.s3.website_url

  # the ssl certificate needs to be validated before it can be used by the cloudfront 
  depends_on = [module.route53]
}

resource "aws_route53_record" "hubertszulc_eu" {
  zone_id = module.route53.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.cloudfront.domain_name
    zone_id                = module.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }
}
