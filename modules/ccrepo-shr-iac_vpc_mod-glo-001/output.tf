output "vpc_id" {
  description = "The id of the VPC created"
  value       = concat(aws_vpc.main.*.id, [""])[0]//aws_vpc.main.*.id

}


output "security_group" {
  description = "The id of the VPC created"
  value       = concat(aws_security_group.from_internet_to_ec2.*.id, [""])[0]//aws_vpc.main.*.id

}