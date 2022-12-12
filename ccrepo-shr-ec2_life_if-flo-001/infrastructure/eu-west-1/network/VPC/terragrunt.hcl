include root {
  path = find_in_parent_folders()
}

terraform {
  
  source = "C:/Users/damadormartinez/OneDrive - Deloitte (O365D)/Proyectos/Personal/Proyectos AWS/Terraform Code/Wordpress_Application/modules/ccrepo-shr-iac_vpc_mod-glo-001"
}

//dependency "rds_snets"  { config_path = "../../../../landing-zone/networking/snet/net" }


inputs = {
  create_vpc    = true
  cidr          = "11.0.0.0/16"
  create_sg     = true
  
}