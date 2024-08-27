# Output do ID da VPC
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the main VPC"
}

# Outputs dos IDs das sub-redes privadas
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnets[*].id
}

# Outputs dos IDs das sub-redes private
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnets[*].id
}

# Outputs dos IDs das sub-redes database
output "database_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.database_subnets[*].id
}