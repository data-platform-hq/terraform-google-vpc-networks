# Google Virtual Private Cloud networks Terraform module
Terraform module for creating Google Virtual Private Cloud resources

## Usage


<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google)          | = 4.24.0 |

## Providers
| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | 4.24.0  |

## Modules
No modules.

## Resources
| Name                                                                                                                                          | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [google_compute_network.main_vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network)     | resource |
| [google_compute_subnetwork.main_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | resource |

## Inputs
| Name                                                                                      | Description                                                                                                                                   | Type       | Default | Required |
| ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------- | :------: |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services).                                                                                          | `string`   | n/a     |   yes    |
| <a name="input_env"></a> [env](#input\_env)                                               | Variable to mark the environment of the resource (used to create services).                                                                   | `string`   | n/a     |   yes    |
| <a name="input_region"></a> [region](#input\_region)                                      | The location or cloud resources region for the environment.                                                                                   | `string`   | n/a     |   yes    |
| <a name="input_create_subnet"></a> [create\_subnet](#input\_create\_subnet)               | When true the network will create a subnet for each region automatically. When set to false user can explicitly connect subnetwork resources. | `bool`     | false   |    no    |
| <a name="input_private_access"></a> [private\_access](#input\_private\_access)            | When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access.        | `bool`     | false   |    no    |
| <a name="input_services_networks"></a> [services\_networks](#input\_services\_networks)   | Service names and CIDR ranges for which VPCs and subnets should be created                                                                    | `map(any)` | {}      |    no    |

## Outputs
| Name                                                   | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| <a name="output_vpc"></a> [vpc](#output\_vpc)          | An identifier for the VPC.             |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | An identifier for the vpc subnetworks. |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-vpc-networks/blob/main/LICENSE)
