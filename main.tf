 terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "charan"
}
resource "aws_db_instance" "myrds" {
    allocated_storage   = var.dbstorage
   storage_type        = "gp3"
   identifier          = "mydb"
   engine              = "mysql"
   engine_version      = "8.0.35"
   instance_class      = "db.t4g.micro"
   username            = "admin"
   password            = "Passw0rd!123"
   publicly_accessible = true
   skip_final_snapshot = true

   tags = {
     Name = "MyRDS"
   }
   
 }
 resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
 resource "aws_security_group" "sg1" {
  name        = "mysec_group"
  vpc_id      = aws_default_vpc.default.id
  tags = {
    Name = "mysec_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.sg1.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 3306
  ip_protocol = "TCP"
  to_port     = 3306
}
