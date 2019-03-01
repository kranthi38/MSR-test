provider "aws" {
  region     = "${var.aws_region}"
}
resource "aws_vpc" "demo-vpc" {
  cidr_block    = "${var.vpc_cidr}"
  tags {
    Name        = "my-vpc"
    }
}
resource "aws_subnet" "subnet1" {
  vpc_id                = "${aws_vpc.demo-vpc.id}"
  cidr_block    = "${var.subnet1}"
  availability_zone = "${var.subnet1-az}"
  tags {
    Name        = "subnet1"
        }
}
resource "aws_subnet" "subnet2" {
  vpc_id        = "${aws_vpc.demo-vpc.id}"
  cidr_block    = "${var.subnet2}"
  availability_zone = "${var.subnet2-az}"
  tags {
    Name        = "subnet2"
        }
}
resource "aws_internet_gateway" "igw" {
  vpc_id                = "${aws_vpc.demo-vpc.id}"
  tags {
    Name                = "my-igw"
        }
}
resource "aws_route_table" "subnet1-rt" {
  vpc_id                = "${aws_vpc.demo-vpc.id}"
  route {
    cidr_block  = "0.0.0.0/0"
        gateway_id      = "${aws_internet_gateway.igw.id}"
        }
  tags {
    Name                = "subnet1-rt"
        }
}
resource "aws_route_table" "subnet2-rt" {
  vpc_id                = "${aws_vpc.demo-vpc.id}"
  route {
    cidr_block  = "0.0.0.0/0"
        gateway_id      = "${aws_internet_gateway.igw.id}"
        }
  tags {
    Name                = "subnet2-rt"
        }
}
resource "aws_route_table_association" "subnet1-ass" {
   route_table_id = "${aws_route_table.subnet1-rt.id}"
   subnet_id      = "${aws_subnet.subnet1.id}"
}
resource "aws_route_table_association" "subnet2-ass" {
   route_table_id = "${aws_route_table.subnet2-rt.id}"
   subnet_id      = "${aws_subnet.subnet2.id}"
}

