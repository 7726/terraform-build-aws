# CloudFront 설정

locals {
  alb_origin_id = "main-alb-origin"
}

resource "aws_cloudfront_distribution" "main-cf" {
  origin {
    domain_name = "${aws_alb.tf-main-alb.dns_name}"
    origin_id = "${local.alb_origin_id}"
    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }

  aliases = [""]   # 도메인 삽입 (ex. www.~~~~.com)
  enabled = true
  is_ipv6_enabled = false
  comment = "Created By Terraform"

  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = "${local.alb_origin_id}"

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"  # none, whitelist, all
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 0
    max_ttl = 0
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["KR"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn = "${var.acm-arn.bingo-arn}"
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }

}