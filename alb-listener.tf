
# front alb 리스너 정책
resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.tf-main-alb.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.front-alb-target-group.arn}"
  }
}