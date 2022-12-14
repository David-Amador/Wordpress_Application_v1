include root {
  path = find_in_parent_folders()
}

terraform {
  
  source = "C:/Users/damadormartinez/OneDrive - Deloitte (O365D)/Proyectos/Personal/Proyectos AWS/Terraform Code/Wordpress_Application/modules/ccrepo-shr-iac_ec2_mod-glo-001"
}
 
dependency  "snet" { config_path = "../../network/SNET" }
dependency   "vpc" {config_path = "../../network/VPC"}

inputs = {
  create_ec2              = true
  instance_type           = "t3.micro"
  snet_id                 = dependency.snet.outputs.snet_id
  vpc_security_group_ids  = dependency.vpc.outputs.security_group
}