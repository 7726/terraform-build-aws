# RDS(MySQL) 설정

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${module.aws-network-configs.bingo-private-subnet1-id}", "${module.aws-network-configs.bingo-private-subnet3-id}"]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "tf-bingo-mysql" {
  identifier = "tf-bingo-mysql"
  name = "tf_bingo_mysql"
  instance_class = "db.t2.micro"
  engine = "mysql"
  engine_version = "5.6.43"
  storage_type = "gp2"
  allocated_storage = 25
  username = var.db-secret.username
  password = var.db-secret.password
  port = 13306
  backup_retention_period = 3
  backup_window = "18:00-18:30" #UTC
  auto_minor_version_upgrade = false
  final_snapshot_identifier = "tf-bingo-mysql"
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.default.name
  multi_az = false
}