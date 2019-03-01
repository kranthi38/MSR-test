resource "aws_key_pair" "mykey" {
   key_name             = "dev"
   public_key           = "${file("dev.pub")}"
}

resource "aws_instance" "instance1" {
   ami                  = "${var.ami_id}"
   instance_type        = "${var.inst_type}"
   subnet_id            = "${aws_subnet.subnet1.id}"
   associate_public_ip_address =true
   key_name             = "${aws_key_pair.mykey.key_name}"
   security_groups      = ["${aws_security_group.sec-grp.id}"]
   user_data = <<EOF
   #!/bin/bash
   sudo hostnamectl set-hostname MSR-test-instance-1
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   sudo apt-get update
   sudo apt-get install -y docker-ce
   sudo systemctl start docker
   sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   EOF
   tags {
     Name               = "MSR-test-instance-1"
     }
}
resource "aws_instance" "instance2" {
   ami                  = "${var.ami_id}"
   instance_type        = "${var.inst_type}"
   subnet_id            = "${aws_subnet.subnet2.id}"
   associate_public_ip_address = true
   key_name             = "${aws_key_pair.mykey.key_name}"
   security_groups      =  ["${aws_security_group.sec-grp.id}"]
   user_data = <<EOF
   #!/bin/bash
   sudo hostnamectl set-hostname MSR-test-instance-2
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   sudo apt-get update
   sudo apt-get install -y docker-ce
   sudo systemctl start docker
   sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   EOF
   tags {
     Name               = "MSR-test-instance-2"
    }
}

resource "aws_security_group" "sec-grp" {
  vpc_id      = "${aws_vpc.demo-vpc.id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
   }
   tags {
     Name="MSR-test-secure"
         }
}

