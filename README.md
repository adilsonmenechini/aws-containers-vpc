<!-- BEGIN_TF_DOCS -->
# Curso de Arquitetura de Containers na AWS - VPC

## Diagrama

![Flow](/docs/vpc.png)

## Comandos

```bash
 ------------------------------------
 Terraform
 ------------------------------------

 make init - Terraform init
 make plan - Terraform plan
 make apply - Terraform apply
 make destroy - Terraform destroy
 make tfdocs - Gerar documentação do Terraform
 make clean - remover variáveis de ambiente
 ```
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.64.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | List of availability zones | `list(string)` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | VPC CIDR block | `string` | n/a | yes |
| <a name="input_database_subnets"></a> [database\_subnets](#input\_database\_subnets) | List of CIDR blocks for database subnets | `list(string)` | n/a | yes |
| <a name="input_enabled_nat_gateway"></a> [enabled\_nat\_gateway](#input\_enabled\_nat\_gateway) | Enable NAT gateway | `bool` | n/a | yes |
| <a name="input_enabled_public_route_table"></a> [enabled\_public\_route\_table](#input\_enabled\_public\_route\_table) | Enable or disable the creation of public route table | `bool` | `true` | no |
| <a name="input_enabled_ssm_parameters"></a> [enabled\_ssm\_parameters](#input\_enabled\_ssm\_parameters) | Enable or disable the creation of SSM parameters | `bool` | `true` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"myproject"` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the main VPC |
<!-- END_TF_DOCS --> 
