locals {
 # Automatically load infrastructure-level variables
  infrastructure_vars = read_terragrunt_config(find_in_parent_folders("infrastructure.hcl"))
  
 # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  
# Extract the needed variables for easy access on this file
  environment_abbrev = local.infrastructure_vars.locals.environment_abbrev
  region             = local.region_vars.locals.region
  region_abbrev      = local.region_vars.locals.region_abbrev
  account_id         = local.region_vars.locals.account_id
  
# Resouce naming pattern
  naming_patern = "%s-${local.account_abbrev}-%s-${local.environment_abbrev}-${local.region_abbrev}-%s"
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
  allowed_account_ids = ["${local.account_id}"]
  profile= personal
} 
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
/*remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "s3bckt-${local.account_abbrev}-tfstate-kronos-${local.environment_abbrev}-${local.region_abbrev}-001"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.region}"
    dynamodb_table = "dyntbl-${local.account_abbrev}-tflock-${local.environment_abbrev}-${local.region_abbrev}-001"
	  role_arn       = "arn:aws:iam::${local.account_id}:role/CAARole-AdministratorAccess"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}*/

# Configure root level configuration that all resources can inherit.
/*terraform {
  extra_arguments "parallelism" {
    commands  = get_terraform_commands_that_need_parallelism()
    arguments = ["-parallelism=2"]
  }
  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=15m"]
  }
}
*/
# Configure root level variables that all resources can inherit.
inputs = merge(
  local.infrastructure_vars.locals,
  local.region_vars.locals,
  { naming_patern = local.naming_patern }
)