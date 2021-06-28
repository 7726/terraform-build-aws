
# Front단 외부 ALB 대상 그룹 정의
resource "aws_alb_target_group" "front-alb-target-group" {
  name = "front-alb-target-group"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${module.aws-network-configs.bingo-vpc-id}"
}

# ALB -> 대상 그룹 연결
resource "aws_alb_target_group_attachment" "front-alb-target-group" {
  target_group_arn = "${aws_alb_target_group.front-alb-target-group.arn}"
  target_id = "${aws_instance.bastion-centos7[0].id}"
  port = 80
}