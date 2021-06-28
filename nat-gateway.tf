# NAT-Gateway 설정

resource "aws_nat_gateway" "default" {
  allocation_id = "${aws_eip.eip-natgw.id}"
  subnet_id = "${module.aws-network-configs.bingo-public-subnet1-id}"

  tags = {
    Name = "bingo-NATgw"
  }
}