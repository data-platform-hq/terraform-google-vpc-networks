# Google Virtual Private Cloud networks Terraform module

Terraform module for creating Google Virtual Private Cloud resources

## Usage


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version   |
|---------------------------------------------------------------------------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_google"></a> [google](#requirement\_google)          | >= 4.69.0 |

## Providers

| Name                                                       | Version |
|------------------------------------------------------------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.69.1  |

## Modules

No modules.

## Resources

| Name                                                                                                                                     | Type     |
|------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network)             | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | resource |

## Inputs

| Name                                                               | Description                                                                                  | Type     | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Required |
|--------------------------------------------------------------------|----------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project in which the resources should be created (for Datahub (alias) GCP project) | `string` | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |   yes    |
| <a name="input_env"></a> [env](#input\_env)                        | Variable to mark the environment of the resource (used to create services)                   | `string` | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |   yes    |
| <a name="input_prefix"></a> [prefix](#input\_prefix)               | Cloud resources base name (used to create services)                                          | `string` | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |    no    |
| <a name="input_suffix"></a> [suffix](#input\_suffix)               | Suffix for resource names                                                                    | `string` | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |    no    |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Configuration for VPCs and subnets                                                           | `object` | <pre>({<br>  name = string<br>  subnets = optional(list(object({<br>    name = string<br>    region = string<br>    subnet_cidr = string<br>    secondary_ranges = optional(list(object({<br>      range_name = string<br>      range_cidr = string<br>    })))<br>    private_ip_google_access = optional(bool)<br>    log_config = optional(object({<br>      aggregation_interval = optional(string)<br>      flow_sampling = optional(number)<br>      metadata = optional(string)<br>    }))<br>  })))<br>})</pre> |    no    |

## Outputs

| Name                                                                    | Description                          |
|-------------------------------------------------------------------------|--------------------------------------|
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name)          | Name of the VPC network              |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id)       | IDs of the created subnets per VPC   |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | Names of the created subnets per VPC |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-vpc-networks/blob/main/LICENSE)
