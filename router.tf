resource "aws_route_table" "public_internet_access" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-public", var.project_name)
  }
}

resource "aws_route" "public_access" {
  count                  = var.enabled_public_route_table ? 1 : 0
  route_table_id         = aws_route_table.public_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


resource "aws_route_table_association" "public_route" {
  for_each = var.enabled_public_route_table ? { for k, v in aws_subnet.public_subnets : k => v } : {}

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_internet_access.id
}
