resource "aws_route53_zone" "hubertszulc_eu" {
  name    = var.domain_name
  comment = var.domain_name

  tags = {
    Name = var.domain_name
  }

  provider = aws.eu_central_1
}

resource "aws_route53_record" "www_hubertszulc_eu" {
  zone_id = aws_route53_zone.hubertszulc_eu.zone_id
  name    = "*.${var.domain_name}"
  type    = "CNAME"
  ttl     = 3600
  records = [var.domain_name]

  provider = aws.eu_central_1
}

# validation records for the ACM certificate
resource "aws_route53_record" "hubertszulc_eu_validation_records" {
  for_each = {
    for dvo in var.acm_certificate_domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = aws_route53_zone.hubertszulc_eu.zone_id

  provider = aws.eu_central_1
}

# validate the ACM certificate - it simply checks if the validation records are present in Route 53
resource "aws_acm_certificate_validation" "hubertszulc_eu" {
  certificate_arn         = var.acm_certificate_arn
  validation_record_fqdns = [for record in aws_route53_record.hubertszulc_eu_validation_records : record.fqdn]

  provider = aws.us_east_1
}
