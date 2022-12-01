include root {
  path = find_in_parent_folders()
}

terraform {
  
  source = "C:/Users/damadormartinez/OneDrive - Deloitte (O365D)/Proyectos/Personal/Proyectos AWS/Terraform Code/Wordpress_Application/modules/ccrepo-shr-iac_ec2_mod-glo-001"
}

dependency  "snet" { config_path = "../../workload/ec2" }


inputs = {
  create_ec2    = true
  instance_type = "t3.micro"
  snet_id     = dependency.snet.outputs.subnet_id
  
}