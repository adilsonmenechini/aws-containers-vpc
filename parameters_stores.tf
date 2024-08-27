resource "aws_ssm_parameter" "vpc" {
  count = var.enabled_ssm_parameters ? 1 : 0

  name  = format("/%s/vpc/vpc_id", var.project_name)
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "subnet_ids" {
  count = var.enabled_ssm_parameters ? length(concat(aws_subnet.private_subnets[*].id, aws_subnet.public_subnets[*].id, aws_subnet.database_subnets[*].id)) : 0

  name  = format("/%s/vpc/subnet_%s", var.project_name, element(concat(aws_subnet.private_subnets[*].tags["Name"], aws_subnet.public_subnets[*].tags["Name"], aws_subnet.database_subnets[*].tags["Name"]), count.index))
  type  = "String"
  value = element(concat(aws_subnet.private_subnets[*].id, aws_subnet.public_subnets[*].id, aws_subnet.database_subnets[*].id), count.index)
}