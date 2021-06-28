
resource "aws_eip" "eip-instance" {
  instance = "${aws_instance.bastion-centos7[0].id}"
  vpc = true
}

resource "aws_eip" "eip-natgw" {
  vpc = true
}