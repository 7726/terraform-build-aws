# 설정된 VPC의 서브넷, 보안그룹 등의 정보를 변수에 저장 (by vpc-subnet.tf)

# Public Subnet A id
output "bingo-public-subnet1-id" {
  value = "${aws_subnet.bingo-public-subnet1.id}"
}

# Public Subnet C id
output "bingo-public-subnet3-id" {
  value = "${aws_subnet.bingo-public-subnet3.id}"
}

# Private Subnet A id
output "bingo-private-subnet1-id" {
  value = "${aws_subnet.bingo-private-subnet1.id}"
}

# Private Subnet C id
output "bingo-private-subnet3-id" {
  value = "${aws_subnet.bingo-private-subnet3.id}"
}

# Bastion Host 보안그룹
output "ec2-bastion-sg-id" {
  value = "${aws_security_group.tf-ec2-bastion.id}"
}

# Front EC2 보안그룹
output "ec2-front-sg-id" {
  value = "${aws_security_group.tf-ec2-front.id}"
}

# Back EC2 보안그룹
output "ec2-back-sg-id" {
  value = "${aws_security_group.tf-ec2-back.id}"
}

# RDS-MySQL 보안그룹
output "bingo-mysql-sg-id" {
  value = "${aws_security_group.tf-rds-mysql.id}"
}

# RDS-MySQL 보안그룹
output "bingo-mysql-sg-name" {
  value = "${aws_security_group.tf-rds-mysql.name}"
}

# ALB 보안그룹
output "bingo-frontalb-sg" {
  value = "${aws_security_group.tf-alb-front.id}"
}

# VPC의 ID 정의
output "bingo-vpc-id" {
  value = "${aws_vpc.bingo-vpc-tf.id}"
}

