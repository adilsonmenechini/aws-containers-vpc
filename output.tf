# Output do ID da VPC
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the main VPC"
}

# Outputs dos IDs das sub-redes privadas
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

# Outputs dos IDs das sub-redes private
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

# Outputs dos IDs das sub-redes database
output "database_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.database[*].id
}

# Outputs dos nomes dos parâmetros SSM para as sub-redes
output "ssm_subnet_parameters" {
  value = [
    for ssm_param in aws_ssm_parameter.subnet_ids :
    {
      name  = ssm_param.name
      value = ssm_param.value
    }
  ]
  description = "List of SSM parameter names and their values for subnets"
}

# Output do nome do parâmetro SSM para o ID da VPC
output "ssm_vpc_parameter" {
  value       = aws_ssm_parameter.vpc.name
  description = "SSM parameter name for the VPC ID"
}
