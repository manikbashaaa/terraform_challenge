variable "region" {
  default = "ap-south-1"
}
variable "ami" {
  default = "ami-0522ab6e1ddcc7055"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "dbstorage" {
  description = "The name of the RDS instance"
  type        = number
  default = 50
}
variable "storage_type" {
  default = "gp3"
}
variable "identifier" {
  default = "mydb"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "8.0.35"
}
variable "instance_class" {
  default = "db.t4g.micro"
}
variable "username" {
  default = "admin"
}
variable "password" {
  default = "Passw0rd!123"
}
variable "publicly_accessible" {
  default = true
}
variable "skip_final_snapshot" {
  default = true
}
