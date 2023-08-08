locals {
  prefix = length(var.prefix) == 0 ? "" : "${var.prefix}-"
  suffix = length(var.suffix) == 0 ? "" : "-${var.suffix}"
  env    = length(var.env) == 0 ? "" : "${var.env}-"

  vpc_subnets = flatten([
    for subnet in coalesce(var.vpc_config.subnets, []) : {
      region                   = subnet.region
      subnet_name              = subnet.name
      subnet_cidr              = subnet.subnet_cidr
      secondary_ranges         = coalesce(subnet.secondary_ranges, [])
      private_ip_google_access = subnet.private_ip_google_access
      log_config               = subnet.log_config
    }
  ])

  vpc_network_name = replace("${local.prefix}${local.env}${local.suffix}${var.vpc_config.name}", "_", "-")

  vpc_subnet_names = {
    for subnet in var.vpc_config.subnets : subnet.name => replace("${local.prefix}${local.env}${local.suffix}${subnet.name}", "_", "-")
  }
}

resource "google_compute_network" "vpc" {
  name                    = local.vpc_network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  for_each      = { for s in local.vpc_subnets : s.subnet_name => s }
  name          = local.vpc_subnet_names[each.key]
  project       = var.project_id
  region        = each.value.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = each.value.subnet_cidr

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ranges
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.range_cidr
    }
  }
  private_ip_google_access = each.value.private_ip_google_access
  dynamic "log_config" {
    for_each = [each.value.log_config]
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
    }
  }
}
