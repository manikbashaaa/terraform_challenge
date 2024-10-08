terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 4.16"
    }
  }
}
resource "aws_instance" "my_server" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Mywebserver"
  }
}

resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_default_security_group" "sg" {
  vpc_id = aws_vpc.mainvpc.id
}
 resource "aws_security_group" "mysec_group" {
    name        = "mysec_group"
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "mysec_group"
}
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
