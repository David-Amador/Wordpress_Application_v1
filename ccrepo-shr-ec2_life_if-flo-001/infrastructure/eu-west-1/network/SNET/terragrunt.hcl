include root {
  path = find_in_parent_folders()
}

terraform {
  
  source = "C:/Users/damadormartinez/OneDrive - Deloitte (O365D)/Proyectos/Personal/Proyectos AWS/Terraform Code/Wordpress_Application/modules/ccrepo-shr-iac_snet_mod-glo-001"
}

dependency "vpc"  { config_path = "../VPC" }


inputs = {
  create_snet             = true
  vpc_id                  = /*"vpc-0986f32560cc7f8f7"*/dependency.vpc.outputs.vpc_id
  cidr                    = "11.0.0.0/24"
  map_public_ip_on_launch = true
}