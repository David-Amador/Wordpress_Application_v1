include root {
  path = find_in_parent_folders()
}

terraform {
  
  source = "C:/Users/damadormartinez/OneDrive - Deloitte (O365D)/Proyectos/Personal/Proyectos AWS/Terraform Code/Wordpress_Application/modules/ccrepo-shr-iac_ec2_mod-glo-001"
}

//dependency "rds_snets"  { config_path = "../../../../landing-zone/networking/snet/net" }


inputs = {
  create_ec2    = true
  instance_type = "t3.micro"
  
}