
# 보안그룹 생성 코드 (설정 코드 별도 - sg-rules.tf)

# Bastion EC2 보안그룹 생성
resource "aws_security_group" "tf-ec2-bastion" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  name = "tf-ec2-bastion"
  description = "Edited By Terraform"
  tags = { Name = "bingo-ec2-sg" }
}

# FE-Web EC2 보안그룹 생성
resource "aws_security_group" "tf-ec2-front" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  name = "tf-ec2-front"
  description = "Edited By Terraform"
  tags = { Name = "bingo-ec2-sg" }
}

# BE-Web EC2 보안그룹 생성
resource "aws_security_group" "tf-ec2-back" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  name = "tf-ec2-back"
  description = "Edited By Terraform"
  tags = { Name = "bingo-ec2-sg" }
}

# Front ALB 보안그룹 생성
resource "aws_security_group" "tf-alb-front" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  name = "tf-alb-front"
  description = "Edited By Terraform"
  tags = { Name = "tf-front-alb" }
}

# RDS - MySQL 보안그룹 생성
resource "aws_security_group" "tf-rds-mysql" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  name = "tf-rds-mysql"
  description = "Edited By Terraform"
  tags = { Name = "tf-rds-mysql"}
}