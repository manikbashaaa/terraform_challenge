 terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = var.region
  
}
resource "aws_db_instance" "myrds" {
   allocated_storage   = var.dbstorage
   storage_type        = var.storage_type
   identifier          = var.identifier
   engine              = var.engine
   engine_version      = var.engine_version
   instance_class      = var.instance_class
   username            = var.username
   password            = var.password
   publicly_accessible = var.publicly_accessible
   skip_final_snapshot = var.skip_final_snapshot

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
