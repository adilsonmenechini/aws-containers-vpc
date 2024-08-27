.PHONY: help, init, plan, apply, destroy, clean, tfdocs

help: 
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' 
	
.DEFAULT_GOAL := help
##
## ------------------------------------
## Terraform
## ------------------------------------
##

## make init - Terraform init
init: 
	@terraform init

validate:
	@terraform validate && terraform fmt --recursive

## make plan - Terraform plan
plan:validate
	@terraform plan -var-file=”environment/dev/terraform.tfvars” -out=plan

## make apply - Terraform apply
apply:
	@terraform apply plan


## make destroy - Terraform destroy
destroy:validate
	@terraform apply -destroy

## make tfdocs - Gerar documentação do Terraform
tfdocs:
	@docker run --rm --volume "$$(pwd):/terraform-docs" -u $$(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 markdown /terraform-docs > docs/tfdoc.md
	@cat docs/.header.md docs/tfdoc.md > README.md
## make clean - remover variáveis de ambiente
clean:
	@rm -rf terraform.* .terraform.* .terraform* plan *-config
## 
## 
## 