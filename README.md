# Google Virtual Private Cloud networks Terraform module
Terraform module for creating Google Virtual Private Cloud resources

## Usage


<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_google"></a> [google](#requirement\_google)          | >= 4.43.0 |

## Providers
| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | 4.43.0  |

## Modules
No modules.

## Resources
| Name                                                                                                                                          | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [google_compute_network.main_vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network)     | resource |
| [google_compute_subnetwork.main_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | resource |

## Inputs
| Name                                                                                      | Description                                                                | Type       | Default                                                                                                        | Required |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ---------- | -------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_region"></a> [region](#input\_region)                                      | The location or cloud resources region for the environment                 | `string`   | <pre><br>us-west1</pre>                                                                                        |   yes    |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id)                        | The ID of the project to which the resource belongs                        | `string`   | n/a                                                                                                            |   yes    |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services)                        | `string`   | n/a                                                                                                            |   yes    |
| <a name="input_services_networks"></a> [services\_networks](#input\_services\_networks)   | Service names and CIDR ranges for which VPCs and subnets should be created | `map(any)` | <pre>{<br> composer = "172.20.1.0/24"<br> dataflow = "172.20.2.0/24"<br> dataproc = "172.20.3.0/24"<br>}</pre> |   yes    |

## Outputs
| Name                                                                                | Description                               |
| ----------------------------------------------------------------------------------- | ----------------------------------------- |
| <a name="output_vpc"></a> [vpc](#output\_vpc)                                       | An identifier for the VPC                 |
| <a name="output_composer_subnet"></a> [composer\_subnet](#output\_composer\_subnet) | An identifier for the composer subnetwork |
| <a name="output_dataflow_subnet"></a> [dataflow\_subnet](#output\_dataflow\_subnet) | An identifier for the dataflow subnetwork |
| <a name="output_dataproc_subnet"></a> [dataproc\_subnet](#output\_dataproc\_subnet) | An identifier for the dataproc subnetwork |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-vpc-networks/blob/main/LICENSE)
