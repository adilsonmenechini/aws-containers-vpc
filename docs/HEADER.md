# Curso de Arquitetura de Containers na AWS - VPC

## Descrição Geral da VPC

Este projeto implementa uma arquitetura de rede na AWS utilizando uma VPC (Virtual Private Cloud) para isolar e proteger os recursos de rede da aplicação. A VPC está configurada com alta disponibilidade e segurança, distribuindo os recursos em múltiplas zonas de disponibilidade na região.

## Componentes da VPC

1. **Sub-redes Públicas**:
   - Estas sub-redes são responsáveis por hospedar componentes que necessitam de acesso direto à internet, como balanceadores de carga.
   - Conectadas a um **Internet Gateway** para permitir tráfego de entrada e saída da internet.

2. **Sub-redes Privadas**:
   - Sub-redes onde os serviços críticos e a lógica de aplicação são executados, sem acesso direto à internet. Essas sub-redes hospedam instâncias EC2, serviços ECS, e funções Lambda.
   - O tráfego de saída para a internet é gerenciado via **NAT Gateways**, garantindo que os serviços internos possam acessar a internet para atualizações e outras necessidades, mas mantendo-os seguros contra acessos externos não autorizados.

3. **Sub-redes de Banco de Dados**:
   - São sub-redes isoladas especificamente para bancos de dados, proporcionando uma camada adicional de segurança. Estas sub-redes são protegidas e configuradas para não ter acesso à internet, garantindo que os dados sejam mantidos seguros.



## Diagrama da Arquitetura

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
 
