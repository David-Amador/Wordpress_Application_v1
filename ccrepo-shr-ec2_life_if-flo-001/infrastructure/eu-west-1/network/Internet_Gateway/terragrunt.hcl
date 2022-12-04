include root {
  path = find_in_parent_folders()
}

terraform {
  
  source = "C:/Users/damadormartinez/OneDrive - Deloitte (O365D)/Proyectos/Personal/Proyectos AWS/Terraform Code/Wordpress_Application/modules/ccrepo-shr-iac_internet_gateway_mod-glo-001 copy"
}

dependency "vpc"  { config_path = "../VPC" }
dependency "snet"  { config_path = "../SNET" }


inputs = {
  create_IG     = true
  vpc_id        = dependency.vpc.outputs.vpc_id
  subnet_id     = dependency.snet.outputs.snet_id
  
}