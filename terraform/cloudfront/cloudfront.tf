locals {
  s3_origin_id = "myS3Origin"
}

resource "aws_cloudfront_distribution" "hubertszulc_eu" {
  origin {
    # domain_name = var.bucket_regional_domain_name
    domain_name = var.website_url
    origin_id   = local.s3_origin_id

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_protocol_policy   = "http-only"
      origin_ssl_protocols     = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_read_timeout      = 30
      origin_keepalive_timeout = 5
    }
    connection_attempts = 3
    connection_timeout  = 10
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = local.s3_origin_id

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD", "OPTIONS"]

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    ssl_support_method             = "sni-only"
    acm_certificate_arn            = var.certificate_arn
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  # TODO: delete the previously created cloudfront
  aliases = ["hubertszulc.eu", "www.hubertszulc.eu"]
}

