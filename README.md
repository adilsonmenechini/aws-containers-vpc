<!-- BEGIN_TF_DOCS -->
# Curso de Arquitetura de Containers na AWS - VPC

#### Descrição Geral da VPC

Este projeto implementa uma arquitetura de rede em AWS utilizando uma VPC (Virtual Private Cloud) para isolar e proteger os recursos de rede da aplicação. A VPC está configurada com alta disponibilidade e segurança, distribuindo os recursos em múltiplas zonas de disponibilidade na região `us-east-1`.

#### Componentes da VPC

1. **Sub-redes Públicas**:
   - **public-subnet-1a**, **subnet-public-1b**, **subnet-public-1c**: Estas sub-redes são responsáveis por hospedar componentes que necessitam de acesso direto à internet, como balanceadores de carga.
   - Conectadas a um **Internet Gateway** para permitir tráfego de entrada e saída da internet.

2. **Sub-redes Privadas**:
   - **private-subnet-1a**, **private-subnet-1b**, **private-subnet-1c**: Sub-redes onde os serviços críticos e a lógica de aplicação são executados, sem acesso direto à internet. Essas sub-redes hospedam instâncias EC2, serviços ECS, e funções Lambda.
   - O tráfego de saída para a internet é gerenciado via **NAT Gateways**, garantindo que os serviços internos possam acessar a internet para atualizações e outras necessidades, mas mantendo-os seguros contra acessos externos não autorizados.

3. **Sub-redes de Banco de Dados**:
   - **database-subnet-1a**, **database-subnet-1b**, **database-subnet-1c**: São sub-redes isoladas especificamente para bancos de dados, proporcionando uma camada adicional de segurança. Estas sub-redes são protegidas e configuradas para não ter acesso à internet, garantindo que os dados sejam mantidos seguros.

#### Segurança e Controle de Acesso

- Cada sub-rede está associada a grupos de segurança e listas de controle de acesso à rede (NACLs) que definem as regras de tráfego de entrada e saída, baseadas em portas e protocolos específicos para cada tipo de serviço.
- Implementação de práticas de segurança recomendadas, incluindo a separação de camadas de aplicação e banco de dados e o uso de criptografia para tráfego de dados sensíveis.

#### Alta Disponibilidade

- A VPC está distribuída por três zonas de disponibilidade (`us-east-1a`, `us-east-1b`, `us-east-1c`), garantindo tolerância a falhas e alta disponibilidade dos serviços implementados.
- Utilização de balanceadores de carga para distribuir o tráfego entre as instâncias em diferentes zonas de disponibilidade.

#### Diagrama da Arquitetura

![Diagrama da VPC](/docs/vpc.png)

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
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.64.0 |
#### Inputs

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
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the main VPC |
<!-- END_TF_DOCS --> 
