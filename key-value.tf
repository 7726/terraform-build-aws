# 해당 파일은 키나 각종 접속 계정 정보 등의 값을 선언했다. 때문에 .gitignore 처리 필수

# IAM 계정의 key 값 정의
variable "key-value" {
  default = {
    access_key = ""
    secret_key = ""
    region = ""
    pubkey_path = ""  # .pub 키 경로 정의
  }
}

# DB 아이디와 패스워드값 정의
variable "db-secret" {
  default = {
    dbname = ""
    username = ""
    password = ""
  }
}

# 도메인의 ACM 인증서 별도 생성 후 arn값 정의
variable "acm-arn" {
  default = {
    bingo-arn = ""
  }
}