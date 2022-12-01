

variable "create_snet" {
  description = "Boolean that define either the snet resource has to be created."
  type        = bool
  default     = false

}


variable "cidr" {
  description = "Variable that defines the ip range of the snet where the resources are going to be deployed."
  type        = string
  default     = ""

}

variable "vpc_id" {
  description = "Variable that defines the id of the VPC where the subnet is going to be deployed"
  type        = string
  default     = ""

}





