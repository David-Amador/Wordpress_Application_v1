

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