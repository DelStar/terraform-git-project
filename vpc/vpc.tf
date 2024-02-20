# Using external data to generate a unique VPC timestamp
data "external" "vpc_name" {
  program = ["python3", "${path.module}/name.py"]
}

# Create VPC with a dynamically generated name
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = data.external.vpc_name.result.name
  }
}

# Creating an Internet Gateway for the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw" # Naming the IGW with a prefix for clarity
  }
}

# Creating an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat-eip" # Naming the EIP with a prefix for clarity
  }
}

# Creating a NAT Gateway using the Elastic IP and a public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "main-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Creating private subnets based on provided CIDR blocks and availability zones
resource "aws_subnet" "private" {
  count             = length(var.private_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name                                 = "private-${count.index}"
    "kubernetes.io/role/elb"             = "1"
    "kubernetes.io/cluster/demo_cluster" = "owned"
  }
}

# Creating public subnets with the same approach as private subnets
resource "aws_subnet" "public" {
  count                   = length(var.public_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name                                 = "public-${count.index}"
    "kubernetes.io/role/elb"             = "1"
    "kubernetes.io/cluster/demo_cluster" = "owned"
  }
}

# Creating a private route table for the VPC
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  depends_on = [aws_subnet.private]

  tags = {
    Name = "main-private-rt"
  }
}

# Creating a public route table for the VPC
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  depends_on = [aws_subnet.public]

  tags = {
    Name = "main-public-rt"
  }
}

# Creating a default route for public subnets to access the internet via the IGW
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

  depends_on = [aws_route_table.public]
}

# Creating a default route for private subnets to access the internet via the NAT Gateway
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  nat_gateway_id         = aws_nat_gateway.nat.id
  destination_cidr_block = "0.0.0.0/0"

  depends_on = [aws_route_table.private]
}

# Associating private subnets with the private route table
resource "aws_route_table_association" "private" {
  count = length(var.private_cidr)

  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id

  depends_on = [aws_route.private_nat_gateway, aws_subnet.private]
}

# Associating public subnets with the public route table
resource "aws_route_table_association" "public" {
  count = length(var.public_cidr)

  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id

  depends_on = [aws_route.public_internet_gateway, aws_subnet.public]
}
