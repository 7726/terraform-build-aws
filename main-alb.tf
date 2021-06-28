# ALB 설정

resource "aws_alb" "tf-main-alb" {
  name = "tf-front-alb"
  internal = false
  security_groups = ["${module.aws-network-configs.bingo-frontalb-sg}"]
  subnets = [
    "${module.aws-network-configs.bingo-public-subnet1-id}",
    "${module.aws-network-configs.bingo-public-subnet3-id}"
  ]

  tags = {
    Name = "tf-main-alb"
  }

  # ALB의 재생성이 필요할 때 재생성으로 인한 Downtime이 없도록 해주는 코드
  lifecycle {
    create_before_destroy = false
  }

}
