variable "project_id" {
  description = "The ID of the project to which the resource belongs"
  type        = string
}

variable "product_base_name" {
  description = "Cloud resources base name (used to create services)"
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "The location or cloud resources region for the environment"
  type        = string
  default     = "us-west1"
}

variable "services_networks" {
  description = "Service names and CIDR ranges for which VPCs and subnets should be created"
  type        = map(any)
  default = {
    composer = "172.20.1.0/24"
    dataflow = "172.20.2.0/24"
    dataproc = "172.20.3.0/24"
  }
}
