resource "aws_eip" "nat_eips" {
  count = var.enabled_nat_gateway ? length(var.public_subnets) : 0

  domain = "vpc"

  tags = {
    Name = format("%s-eip-%s", var.project_name, element(var.azs, count.index))
  }
}

resource "aws_nat_gateway" "nat_gateways" {
  count = var.enabled_nat_gateway ? length(var.public_subnets) : 0

  allocation_id = aws_eip.nat_eips[count.index].id
  subnet_id     = aws_subnet.public_subnets[count.index].id

  tags = {
    Name = format("%s-nat-gateway-%s", var.project_name, element(var.azs, count.index))
  }

  depends_on = [aws_eip.nat_eips]
}