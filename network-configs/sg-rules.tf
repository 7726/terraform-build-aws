
# Main-alb 보안그룹
resource "aws_security_group_rule" "tf-alb-front-http" {
  from_port = 80
  protocol = "TCP"
  security_group_id = "${aws_security_group.tf-alb-front.id}"
  to_port = 80
  type = "ingress"
  cidr_blocks = ["10.0.10.0/24"]
}


# RDS-MySQL 보안그룹
resource "aws_security_group_rule" "tf-rds-mysql" {
  from_port = 13306
  protocol = "TCP"
  security_group_id = "${aws_security_group.tf-rds-mysql.id}"
  to_port = 13306
  type = "ingress"
  cidr_blocks = ["10.0.10.0/24", "10.0.30.0/24"]
}


# Bastion EC2 규칙
resource "aws_security_group_rule" "tf-ec2-bastion-ssh" {
  from_port = 22
  protocol = "TCP"
  security_group_id = "${aws_security_group.tf-ec2-bastion.id}"
  to_port = 22
  type = "ingress"
  cidr_blocks = [""]  # BASTION HOST에 접근을 허용할 IP(CIDR 표기) 설정
  lifecycle { create_before_destroy = true }
}


# Front-End EC2 규칙
resource "aws_security_group_rule" "tf-ec2-feweb-http" {
  from_port = 80
  protocol = "TCP"
  security_group_id = "${aws_security_group.tf-ec2-front.id}"
  to_port = 80
  type = "ingress"
  cidr_blocks = ["10.0.0.0/16"]
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "tf-ec2-feweb-ssh" {
  from_port = 22
  protocol = "TCP"
  security_group_id = "${aws_security_group.tf-ec2-front.id}"
  to_port = 22
  type = "ingress"
  cidr_blocks = ["10.0.10.10/32"]
  lifecycle { create_before_destroy = true }
}


# Back-End EC2 규칙
resource "aws_security_group_rule" "tf-ec2-beweb-http" {
  from_port = 8080
  protocol = "TCP"
  security_group_id = "${aws_security_group.tf-ec2-back.id}"
  to_port = 8080
  type = "ingress"
  cidr_blocks = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "tf-ec2-beweb-ssh" {
  from_port = 22
  protocol = "TCP"
  security_group_id = "${aws_security_group.tf-ec2-back.id}"
  to_port = 22
  type = "ingress"
  cidr_blocks = ["10.0.10.10/32"]
  lifecycle { create_before_destroy = true }
}


# OutBound 공통
resource "aws_security_group_rule" "sg-outbound-bastion" {
  from_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.tf-ec2-bastion.id}"
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "sg-outbound-frontend" {
  from_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.tf-ec2-front.id}"
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "sg-outbound-backend" {
  from_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.tf-ec2-back.id}"
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "sg-outbound-mysql" {
  from_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.tf-rds-mysql.id}"
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "sg-outbound-alb" {
  from_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.tf-alb-front.id}"
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  lifecycle { create_before_destroy = true }
}