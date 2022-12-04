

variable "create_IG" {
  description = "Boolean that define either the internet gatewat resource has to be created."
  type        = bool
  default     = false

}


variable "vpc_id" {
  description = "Variable that defines the ip range of the vpc where the resources are going to be deployed."
  type        = string
  default     = ""

}

variable "subnet_id" {
  description = "Variable that defines the id of the subnet where the EC2 instance is defined."
  type        = string
  default     = ""

}