resource "aws_vpc" "main" {

  count =local.create ? 1:0  //Determinar si se crea el resource

  cidr_block = var.cidr
}



resource "aws_security_group" "from_internet_to_ec2" {

  count =local.create ? 1:0  //Determinar si se crea el resource

  name        = "from_internet_to_ec2"
  description = "Allow all inbound traffic from the Internet to the Ec2"
  vpc_id      = aws_vpc.main.*.id [0]

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.main.*.cidr_block [0]]
  }
   ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}