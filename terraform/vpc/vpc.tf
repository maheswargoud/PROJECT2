resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_number 
  name = var.vpc_name
  instance_tenancy = "default"
  enable_dns_support = "true"
}

# creating the public subnet
resource "aws_subnet" "pubsubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "var.pubsubnet"
  map_public_ip_on_launch="true"

  tags = {
    Name = "Main"
  }


# depends_on = [
#   aws_vpc.vpc
# ]

}
resource "aws_subnet" "pubsubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "var.pubsubnet"

  tags = {
    Name = "Main"
  }
  

# depends_on = [
#   aws_vpc.vpc
# ]

}

resource "aws_subnet" "pubsubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "var.pubsubnet"

  tags = {
    Name = "Main"
  }
  

# depends_on = [
#   aws_vpc.vpc
# ]

}



# igw 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw
  }
}

#nat-gw

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pubsunet.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}

resource "aws_eip" "eip" {
  vpc      = true
}

# Route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "private"
  
}
}

# associate 
resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.pubsubnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# nacl 
resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}
resource "aws_network_acl" "data" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

