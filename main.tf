resource "google_compute_network" "main_vpc_network" {
  name                    = "${var.env}-${var.product_base_name}-vpc"
  auto_create_subnetworks = var.create_subnet
}

resource "google_compute_subnetwork" "main_subnet" {
  for_each = var.services_networks

  name          = "${each.key}-${var.env}-${var.product_base_name}-subnet"
  ip_cidr_range = each.value

  region                   = var.region
  private_ip_google_access = var.private_access
  network                  = google_compute_network.main_vpc_network.id
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

  # log_config {
  #   aggregation_interval = lookup(var.log_config, "aggregation_interval", "")
  #   flow_sampling        = lookup(var.log_config, "flow_sampling", null)
  #   metadata             = lookup(var.log_config, "metadata", "")
  #   metadata_fields      = lookup(var.log_config, "metadata_fields", [])
  #   filter_expr          = lookup(var.log_config, "filter_expr", "")
  # }

  # dynamic "log_config" {
  #   for_each = var.log_config

  #   content {
  #     aggregation_interval = lookup(log_config, "aggregation_interval", "")
  #     flow_sampling        = lookup(log_config, "flow_sampling", null)
  #     metadata             = lookup(log_config, "metadata", "")
  #     metadata_fields      = lookup(log_config, "metadata_fields", [])
  #     filter_expr          = lookup(log_config, "filter_expr", "")
  #   }
  # }

  depends_on = [google_compute_network.main_vpc_network]
}
