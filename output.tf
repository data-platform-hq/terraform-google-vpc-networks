output "vpc" {
  value       = google_compute_network.main_vpc_network.id
  description = "An identifier for the VPC"
}

output "composer_subnet" {
  value       = google_compute_subnetwork.main_subnet["composer"].id
  description = "An identifier for the composer subnetwork"
}

output "dataflow_subnet" {
  value       = google_compute_subnetwork.main_subnet["dataflow"].id
  description = "An identifier for the dataflow subnetwork"
}

output "dataproc_subnet" {
  value       = google_compute_subnetwork.main_subnet["dataproc"].id
  description = "An identifier for the dataproc subnetwork"
}
