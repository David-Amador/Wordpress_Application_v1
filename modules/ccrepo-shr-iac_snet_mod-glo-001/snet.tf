
resource "aws_subnet" "snet" {

  count =local.create ? 1:0  //Determinar si se crea el resource

  vpc_id     = var.vpc_id
  cidr_block = var.cidr

 
}