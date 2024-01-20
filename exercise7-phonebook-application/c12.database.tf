resource "aws_db_instance" "my-database-server" {
  allocated_storage     = 20
  max_allocated_storage = 40
  identifier            = "phonebook-app-db"

  db_name        = "clarusway_phonebook"
  engine         = "mysql"
  engine_version = "8.0.19"
  instance_class = "db.t2.micro"
  username       = "admin"
  password       = "Clarusway_1"
  port           = 3306

  skip_final_snapshot = true
  publicly_accessible = false

  db_subnet_group_name    = module.aws_default_vpc.database_subnet_group_name
  vpc_security_group_ids  = [aws_security_group.MyDBSecurityGroup.id]
  backup_retention_period = 0
}
