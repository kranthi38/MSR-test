variable "ami_id" {
   default = "ami-0d96d570269578cd7"
}
variable "inst_type" {
   default = "t2.micro"
}
variable "aws_region" {
   default = "us-east-1"
}
variable "vpc_cidr" {
   default = "10.16.0.0/26"
}
variable "subnet1" {
   default = "10.16.0.0/28"
}
variable "subnet2" {
   default = "10.16.0.16/28"
}
variable "subnet1-az" {
   default = "us-east-1a"
}
variable "subnet2-az" {
   default = "us-east-1b"

