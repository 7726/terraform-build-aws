# Internet Gateway 설정

# 적용할 VPC에 외부와 통신할 인터넷 게이트웨이 적용
resource "aws_internet_gateway" "bingo-gateway" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  tags = {
    Name = "bingo-gateway"
  }
}