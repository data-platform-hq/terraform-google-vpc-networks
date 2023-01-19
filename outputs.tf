output "vpc" {
  value       = google_compute_network.main_vpc_network.id
  description = "An identifier for the VPC"
}

output "subnet" {
  value       = { for k, v in var.services_networks : k => google_compute_subnetwork.main_subnet[k].id }
  description = "An identifier for the vpc subnetworks"
}
