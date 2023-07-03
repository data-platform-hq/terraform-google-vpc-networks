variable "project_id" {
  description = "ID of the project in which the resources should be created (for Datahub (alias) GCP project)."
  type        = string
  default     = ""
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "region" {
  description = "The location or cloud resources region for the environment."
  type        = string
}

# variable "create_subnet" {
#   description = "When true the network will create a subnet for each region automatically. When set to false user can explicitly connect subnetwork resources."
#   type        = bool
#   default     = false
# }

# variable "private_access" {
#   description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
#   type        = bool
#   default     = false
# }
variable "prefix" {
  description = "Cloud resources base name (used to create services)."
  type        = string
  default     = ""
}

variable "suffix" {
  description = "Suffix for resource names"
  type        = string
  default     = ""
}

variable "vpc_config" {
  description = "Configuration for VPCs and subnets"
  type = object({
    name = string
    subnets = optional(list(object({
      name        = string
      region      = string
      subnet_cidr = string
      secondary_ranges = optional(list(object({
        range_name = string
        range_cidr = string
      })))
      private_ip_google_access = optional(bool)
      log_config = optional(object({
        aggregation_interval = optional(string)
        flow_sampling        = optional(number)
        metadata             = optional(string)
      }))
    })))
  })
  default = {
    name = "vpc1"
    subnets = [
      {
        name        = "subnet1"
        region      = "us-central1"
        subnet_cidr = "10.0.1.0/24"
        secondary_ranges = [
          {
            range_name = "secondary-range1"
            range_cidr = "10.0.2.0/24"
          },
          {
            range_name = "secondary-range2"
            range_cidr = "10.0.3.0/24"
          }
        ]
        private_ip_google_access = true
        log_config = {
          aggregation_interval = "INTERVAL_5_MIN"
          flow_sampling        = 0.5
          metadata             = "INCLUDE_ALL_METADATA"
        }
      },
      {
        name        = "subnet2"
        region      = "us-east1"
        subnet_cidr = "10.1.0.0/24"
      }
    ]
  }
}
