
# ALB DNS
output "main-alb-dns" {
  value = "${aws_alb.tf-main-alb.dns_name}"
}
