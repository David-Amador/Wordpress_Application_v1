

variable "create_vpc" {
  description = "Boolean that define ehwther the user resource has to be created."
  type        = bool
  default     = false

}


variable "cidr" {
  description = "Variable that defines the type of the Ec2 intance that has to be created."
  type        = string
  default     = ""

}