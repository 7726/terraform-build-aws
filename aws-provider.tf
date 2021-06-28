# AWS 서비스에 접근하기 위한 IAM의 키 값을 호출한다. (by ./key-value.tf)

# 리전, 키 값 호출하여 설정
provider "aws" {
  access_key = "${var.key-value.access_key}"
  secret_key = "${var.key-value.secret_key}"
  region = "${var.key-value.region}"
}

# network-configs 내의 네트워크 설정을
module "aws-network-configs" {
  source = "./network-configs"
}

