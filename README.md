# CIPHERTRUST_MODULE_AWS

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Optional variables
	 aws_region  = ""
	 ciphertrust_ami_id  = ""
	 infra_env  = ""
	 name_instance  = ""
	 project_name  = ""
	 script_path_ansible  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [aws_instance.ciphertrust_aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.ciphertust_network_default_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.ciphertust_network_routing_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.ciphertust_network_routing_associate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.ciphertust_network_firewall](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.ciphertust_network_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.ciphertust_network](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [local_file.connection_node](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.change_initial_password](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.inject_license](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [tls_private_key.ciphertrust_ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region Thales CipherTrust Manager will be deployed in. | `string` | `""` | no |
| <a name="input_ciphertrust_ami_id"></a> [ciphertrust\_ami\_id](#input\_ciphertrust\_ami\_id) | Put AMI ID you get from AWS Marketplace | `string` | `""` | no |
| <a name="input_infra_env"></a> [infra\_env](#input\_infra\_env) | Name of environment CM | `string` | `""` | no |
| <a name="input_name_instance"></a> [name\_instance](#input\_name\_instance) | Name of intance ciphertrust manager | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of Project | `string` | `""` | no |
| <a name="input_script_path_ansible"></a> [script\_path\_ansible](#input\_script\_path\_ansible) | this is script for ansible | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | CipherTrust Manager's Public IP Address |
| <a name="output_tls_private_key"></a> [tls\_private\_key](#output\_tls\_private\_key) | CipherTrust Manager's Admin SSH Private Key |
| <a name="output_tls_public_key"></a> [tls\_public\_key](#output\_tls\_public\_key) | CipherTrust Manager's Admin SSH Public Key |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->