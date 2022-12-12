resource "aws_instance" "web" {

    count =local.create ? 1:0  //Determinar si se crea el resource 

  ami                     = data.aws_ami.ec2_wordpress[0].id
  instance_type           = var.instance_type
  subnet_id               = var.snet_id
  vpc_security_group_ids  = [var.vpc_security_group_ids]
  
}
/*
resource "aws_eip" "eip"{
  vpc = true
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.*.id [0]
  allocation_id = aws_eip.eip.id
}*/