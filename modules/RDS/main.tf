resource "aws_db_instance" "mysql" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name                 = var.db_name
  username             = var.username
  password             = var.password
  #db_subnet_group_name    = var.db_subnet_group_name
  publicly_accessible  = var.publicly_accessible
  skip_final_snapshot = true
}