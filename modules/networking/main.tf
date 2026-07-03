resource "aws_vpc" "this" {
  region     = var.region
  cidr_block = var.vpc_cidr_range

  tags = {
    Name = "${var.base_name}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  region = var.region
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.base_name}-igw"
  }
}

resource "aws_subnet" "this_public" {
  for_each = var.subnet_config_public

  vpc_id                  = aws_vpc.this.id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = true

  tags = {
    "Name"                                           = "public-${each.key}"
    "kubenetes.io/role/elb"                          = "1"
    "kubernetes.io/cluster/${var.base_name}-cluster" = "owned"
  }
}

resource "aws_subnet" "this_private" {
  for_each = var.subnet_config_private

  vpc_id            = aws_vpc.this.id
  availability_zone = each.key
  cidr_block        = each.value

  tags = {
    "Name"                                           = "private-${each.key}"
    "kubenetes.io/role/internal-elb"                 = "1"
    "kubernetes.io/cluster/${var.base_name}-cluster" = "owned"
  }
}

resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${var.base_name}-nat-ip"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.this_public[var.nat_zone].id

  tags = {
    Name = "${var.base_name}-nat"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "this_private" {
  for_each = var.subnet_config_private

  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = each.value
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "${var.base_name}-private-route-table"
  }
}

resource "aws_route_table" "this_public" {
  for_each = var.subnet_config_public

  vpc_id = aws_vpc.this.id

  route {
    cidr_block = each.value
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.base_name}-public-route-table"
  }
}

resource "aws_route_table_association" "this_private" {
  for_each = var.subnet_config_private

  subnet_id      = aws_subnet.this_private[each.key].id
  route_table_id = aws_route_table.this_private[each.key].id
}

resource "aws_route_table_association" "this_public" {
  for_each = var.subnet_config_public

  subnet_id      = aws_subnet.this_public[each.key].id
  route_table_id = aws_route_table.this_public[each.key].id
}
