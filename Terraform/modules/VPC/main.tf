resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_support = true 
  enable_dns_hostnames = true
  

  tags = {
    Name = "VPC-Terraform"
  }
}

# Create Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block =  var.subnet_cidr
    availability_zone = var.az
    map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# Route Table for Public Subnet

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

# Route Table for Public Subnet

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Route Table Association for Public Subnet

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}