resource "aws_instance" "web" {

    count =local.create ? 1:0  //Determinar si se crea el resource 

  ami               = data.aws_ami.ec2_wordpress[0].id
  instance_type     = var.instance_type

  
}