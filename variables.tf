variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "database_subnets" {
  description = "List of CIDR blocks for database subnets"
  type        = list(string)
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "myproject"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "enabled_nat_gateway" {
  description = "Enable NAT gateway"
  type        = bool
}

variable "enabled_ssm_parameters" {
  description = "Enable or disable the creation of SSM parameters"
  type        = bool
  default     = true
}