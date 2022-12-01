

variable "create_vpc" {
  description = "Boolean that define either the vpc resource has to be created."
  type        = bool
  default     = false

}


variable "cidr" {
  description = "Variable that defines the ip range of the vpc where the resources are going to be deployed."
  type        = string
  default     = ""

}