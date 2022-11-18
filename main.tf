resource "google_compute_network" "main_vpc_network" {
  name                    = "${var.env}-${var.product_base_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main_subnet" {
  for_each                 = var.services_networks
  name                     = "${each.key}-${var.env}-${var.product_base_name}-subnet"
  ip_cidr_range            = each.value
  private_ip_google_access = true
  network                  = google_compute_network.main_vpc_network.id
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
  depends_on = [google_compute_network.main_vpc_network]
}
