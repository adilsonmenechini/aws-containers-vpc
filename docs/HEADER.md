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
 
