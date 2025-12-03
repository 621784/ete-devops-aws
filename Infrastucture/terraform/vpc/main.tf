# VPC
 
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
 
  tags = {
    Name = "${var.project}-vpc"
  }
}
 

# PUBLIC SUBNETS

 
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
 
  tags = {
    Name = "${var.project}-public-${count.index + 1}"
  }
}
 

# PRIVATE SUBNETS

 
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
 
  tags = {
    Name = "${var.project}-private-${count.index + 1}"
  }
}
 

# INTERNET GATEWAY

 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
 
  tags = {
    Name = "${var.project}-igw"
  }
}
 

# PUBLIC ROUTE TABLE

 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
 
  tags = {
    Name = "${var.project}-public-rt"
  }
}
 
resource "aws_route_table_association" "public_association" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
 

# NAT GATEWAY (for private subnets)

 
resource "aws_eip" "nat_eip" {
  domain = "vpc"
 
  tags = {
    Name = "${var.project}-nat-eip"
  }
}
 
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id
 
  tags = {
    Name = "${var.project}-nat-gw"
  }
}
 

# PRIVATE ROUTE TABLE

 
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
 
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
 
  tags = {
    Name = "${var.project}-private-rt"
  }
}
 
resource "aws_route_table_association" "private_association" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
