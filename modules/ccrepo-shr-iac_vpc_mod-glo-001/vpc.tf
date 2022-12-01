resource "aws_vpc" "main" {

  count =local.create ? 1:0  //Determinar si se crea el resource

  cidr_block = "10.0.0.0/16"
}