

variable "create_ec2" {
  description = "Boolean that define ehwther the user resource has to be created."
  type        = bool
  default     = false

}


variable "instance_type" {
  description = "Variable that defines the type of the Ec2 intance that has to be created."
  type        = string
  default     = ""

}


variable "snet_id" {
  description = "Variable that defines the id of the VPC where the subnet is going to be deployed"
  type        = string
  default     = ""

}


variable "vpc_security_group_ids" {
  description = "Variable that defines the id of the VPC where the subnet is going to be deployed"
  type        = string
  default     = ""

}