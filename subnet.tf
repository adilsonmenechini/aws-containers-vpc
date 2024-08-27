resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.project_name}-private-subnet-${element(var.azs, count.index)}"
  }
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.project_name}-public-subnet-${element(var.azs, count.index)}"
  }
}

resource "aws_subnet" "database_subnets" {
  count = length(var.database_subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.database_subnets, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.project_name}-database-subnet-${element(var.azs, count.index)}"
  }
}