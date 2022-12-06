variable "product_base_name" {
  description = "Cloud resources base name (used to create services)."
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "region" {
  description = "The location or cloud resources region for the environment"
  type        = string
}

variable "create_subnet" {
  description = "When set to true, the network will create a subnet for each region automatically. When set to false, the user can explicitly connect subnetwork resources"
  type        = bool
  default     = false
}

variable "private_access" {
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
  type        = bool
  default     = false
}

variable "services_networks" {
  description = "Service names and CIDR ranges for which VPCs and subnets should be created"
  type        = map(string)
  default     = {}
}
