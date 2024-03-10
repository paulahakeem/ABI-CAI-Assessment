module "network" {
  source               = "./modules/NETWORK"
  vpc_name             = "Paula-MainVpc"
  vpc_cidr             = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  # ----------------------- #
  subnets                     = var.subnets
  availability_zones          = "us-east-1a"
  auto_assign_public_ip_state = true
  # ----------------------- #
  cidr_from_anywhere = "0.0.0.0/0"
  public_route_name  = "public-route"
  private_route_name = "private-route"
  # ----------------------- #
  internet_gateway_name = "paula-IGW"
  natgateway_name       = "paula-NGW"
  # ----------------------- #
  security_group_name        = "paula-SG"
  security_group_description = "Allow HTTP traffic from anywhere"
  inport                     = ["80", "22", "443"]
  in_protocol                = "tcp"
  eg_port                    = 0
  eg_protocol                = "-1"
}
# ----------------------- ------------------------------------#
module "backendEC2" {
  source                      = "./modules/VMS"
  ec2_name                    = "backend"
  ec2_ami                     = "ami-0cd59ecaf368e5ccf"
  ec2_type                    = "t2.micro"
  SG_id                       = [module.network.secgroup-id]
  ec2_subnet_ID               = module.network.public_subnet_id1
  associate_public_ip_address = true
  key_pair                    = "paula"
}
# ----------------------- ------------------------------------#
module "frontendEC2" {
  source                      = "./modules/VMS"
  ec2_name                    = "frontend"
  ec2_ami                     = "ami-0cd59ecaf368e5ccf"
  ec2_type                    = "t2.micro"
  SG_id                       = [module.network.secgroup-id]
  ec2_subnet_ID               = module.network.public_subnet_id1
  associate_public_ip_address = true
  key_pair                    = "paula"
}
# ----------------------- ------------------------------------#
module "database" {
  source               = "./modules/RDS"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t2.micro"
  db_name              = "mysqldb"
  username             = "admin"
  password             = "admin123"
  publicly_accessible  = false
}
