# Create a VPC
resource "aws_vpc" "VPC-EKS" {
  cidr_block = "10.150.0.0/22"

  instance_tenancy = "default"

  enable_dns_hostnames = "true"

  tags = {
    Name = "VPC-EKS"
  }
}


resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.VPC-EKS.id
  cidr_block              = "10.150.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = "true"
  depends_on = [
    aws_vpc.VPC-EKS,
  ]
  tags = {
    Name = "Subnet-EKS-A"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.VPC-EKS.id
  cidr_block        = "10.150.2.0/24"
  availability_zone = "us-east-2b"
  #map_public_ip_on_launch = "true"
  depends_on = [
    aws_vpc.VPC-EKS,
  ]

  tags = {
    Name = "Subnet-EKS-B"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.VPC-EKS.id
  cidr_block = "10.150.3.0/24"

  tags = {
    Name = "Subnet-EKS-C"
  }
}


resource "aws_internet_gateway" "gw_eks" {
  vpc_id = aws_vpc.VPC-EKS.id

  tags = {
    Name = "gw_eks"
  }
}

resource "aws_route_table" "r-eks" {
  vpc_id = aws_vpc.VPC-EKS.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_eks.id
  }

  depends_on = [
    aws_vpc.VPC-EKS,
  ]
  tags = {
    Name = "route-eks"

  }
}

resource "aws_route_table_association" "assoc-r-eks" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.r-eks.id
  depends_on = [
    aws_subnet.subnet1,
  ]
}