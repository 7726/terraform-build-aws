
# 키페어 지정, 인스턴스 설정 및 생성

variable "key_pair" {
  default = "aws-key"
}

# Bastion Host
resource "aws_instance" "bastion-centos7" {
  ami = "${data.aws_ami.centos.id}"
  instance_type = "t3a.nano"
  subnet_id = "${module.aws-network-configs.bingo-public-subnet1-id}"
  vpc_security_group_ids = [
    "${module.aws-network-configs.ec2-bastion-sg-id}"
  ]
  key_name = "${var.key_pair}"
  count = 1
  tags = {
    Name = "bastion"
  }
  associate_public_ip_address = false
  private_ip = "10.0.10.10"

  lifecycle {
    create_before_destroy = false
  }
}

# NGINX Front Server
resource "aws_instance" "FE-web" {
  ami = "${data.aws_ami.centos.id}"
  instance_type = "t3a.micro"
  subnet_id = "${module.aws-network-configs.bingo-private-subnet1-id}"
  vpc_security_group_ids = [
    "${module.aws-network-configs.ec2-front-sg-id}"
  ]
  key_name = "${var.key_pair}"
  count = 1
  tags = {
    Name = "FE-web"
  }
  associate_public_ip_address = false
  private_ip = "10.0.40.100"

  lifecycle {
    create_before_destroy = true
  }
}

# TOMCAT Back Server
resource "aws_instance" "BE-web" {
  ami = "${data.aws_ami.centos.id}"
  instance_type = "t3a.micro"
  subnet_id = "${module.aws-network-configs.bingo-private-subnet1-id}"
  vpc_security_group_ids = [
    "${module.aws-network-configs.ec2-back-sg-id}"
  ]
  key_name = "${var.key_pair}"
  count = 1
  tags = {
    Name = "BE-web"
  }
  associate_public_ip_address = false
  private_ip = "10.0.40.200"

  lifecycle {
    create_before_destroy = true
  }
}