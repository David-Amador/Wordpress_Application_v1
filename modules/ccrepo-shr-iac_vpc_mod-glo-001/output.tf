output "vpc_id" {
  description = "The id of the VPC created"
  value       = concat(aws_vpc.main.*.id, [""])[0]//aws_vpc.main.*.id

}