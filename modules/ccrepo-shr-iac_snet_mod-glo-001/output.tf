output "snet_id" {
  description = "The id of the VPC created"
  value       = concat(aws_subnet.snet.*.id, [""])[0]//aws_subnet.snet.*.id

}