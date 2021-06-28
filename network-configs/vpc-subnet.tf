# VPC, 서브넷 선언 및 설정

# VPC 생성
resource "aws_vpc" "bingo-vpc-tf" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "bingo-vpc-tf"
  }
}

# 퍼블릭 서브넷 생성
resource "aws_subnet" "bingo-public-subnet1" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "bingo-pub-sub1"
  }
}

resource "aws_subnet" "bingo-public-subnet3" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  cidr_block = "10.0.30.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "bingo-pub-sub3"
  }
}

# 프라이빗 서브넷 생성
resource "aws_subnet" "bingo-private-subnet1" {
  vpc_id = "${aws_vpc.bingo-vpc-tf.id}"
  cidr_block = "10.0.40.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "bingo-prv-sub1"
  }
}

resource "aws_subnet" "bingo-private-subnet3" {
  vpc_id = aws_vpc.bingo-vpc-tf.id
  cidr_block = "10.0.60.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "bingo-prv-sub3"
  }
}
