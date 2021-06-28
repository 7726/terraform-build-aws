
# 서브넷 라우팅

# 퍼블릭 라우트 테이블 설정 (ig 연결)
resource "aws_route_table" "bingo-route-table" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.bingo-gateway.id}"
  }
  tags = {
    Name = "bingo-route-table"
  }
}

# 퍼블릭 라우트 테이블에 연결할 퍼블릭 서브넷만 연결
resource "aws_route_table_association" "my-subnet-association" {
  route_table_id = "${aws_route_table.bingo-route-table.id}"
  subnet_id = "${aws_subnet.bingo-public-subnet1.id}"
}

resource "aws_route_table_association" "my-subnet-association2" {
  route_table_id = "${aws_route_table.bingo-route-table.id}"
  subnet_id = "${aws_subnet.bingo-public-subnet3.id}"
}