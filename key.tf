
resource "aws_key_pair" "terraform-key" {
  key_name = "aws-key"
  public_key = "${file("")}"  # pub 키의 경로 넣기
}