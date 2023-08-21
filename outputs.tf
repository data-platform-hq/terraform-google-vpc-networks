output "vpc_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.vpc.name
}

output "subnet_id" {
  description = "IDs of the created subnets per VPC"
  value = {
    for subnet in var.vpc_config.subnets : subnet.name => google_compute_subnetwork.subnet[subnet.name].id
    if var.vpc_config.subnets != null
  }
}

output "subnet_name" {
  description = "Names of the created subnets per VPC"
  value = {
    for subnet in var.vpc_config.subnets : subnet.name => google_compute_subnetwork.subnet[subnet.name].name
    if var.vpc_config.subnets != null
  }
}
