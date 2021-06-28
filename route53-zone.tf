# Route 53 설정

data "aws_route53_zone" "main" {
  name         = "" # 본인의 도메인 삽입 (ex. ~~~.com)
  private_zone = false
}

resource "aws_route53_record" "route" {
  zone_id = "${data.aws_route53_zone.main.id}"
  name    = "test.${data.aws_route53_zone.main.name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_cloudfront_distribution.main-cf.domain_name}"]
  set_identifier = "tf-bingo-test"
  geolocation_routing_policy {
    country = "KR"
  }
}