resource "aws_vpc" "main" {
    cidr_block = var.VPC_cidr_block
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "main"
    }
}

resource "aws_subnet" "main-public01" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public01_cidr_block
    map_public_ip_on_launch = "true"
    availability_zone = lookup(var.AWS_AZ, var.AWS_REGION)[0]
    tags = {
        Name = "main-public-1"
    }
  
}

resource "aws_subnet" "main-public02" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public02_cidr_block
    map_public_ip_on_launch = "true"
    availability_zone = lookup(var.AWS_AZ, var.AWS_REGION)[1]
    tags = {
        Name = "main-public02"
    }
  
}

resource "aws_subnet" "main-public03" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public03_cidr_block
    map_public_ip_on_launch = "true"
    availability_zone = lookup(var.AWS_AZ, var.AWS_REGION)[2]
    tags = {
        Name = "main-public03"
    }
  
}

resource "aws_subnet" "main-private01" {

    vpc_id = aws_vpc.main.id
    cidr_block = var.private01_cidr_block
    map_public_ip_on_launch = false
    availability_zone = lookup(var.AWS_AZ, var.AWS_REGION)[0]
    tags = {
      Name = "main-private01"
    }
  
}

resource "aws_subnet" "main-private02" {

    vpc_id = aws_vpc.main.id
    cidr_block = var.private02_cidr_block
    map_public_ip_on_launch = false
    availability_zone = lookup(var.AWS_AZ, var.AWS_REGION)[1]
    tags = {
      Name = "main-private02"
    }
  
}

resource "aws_subnet" "main-private03" {

    vpc_id = aws_vpc.main.id
    cidr_block = var.private03_cidr_block
    map_public_ip_on_launch = false
    availability_zone = lookup(var.AWS_AZ, var.AWS_REGION)[2]
    tags = {
      Name = "main-private03"
    }
  
}

resource "aws_internet_gateway" "main-gw" {

    vpc_id = aws_vpc.main.id

    tags = {
      Name = "main-gw"
    }
  
}

resource "aws_route_table" "main-public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-gw.id
    }

    tags = {
      Name = "main-public"
    }
  
}

resource "aws_route_table_association" "main-public01-a" {
    subnet_id = aws_subnet.main-public01.id
    route_table_id = aws_route_table.main-public.id
}
resource "aws_route_table_association" "main-public02-a" {
    subnet_id = aws_subnet.main-public02.id
    route_table_id = aws_route_table.main-public.id
}
resource "aws_route_table_association" "main-public03-a" {
    subnet_id = aws_subnet.main-public03.id
    route_table_id = aws_route_table.main-public.id
}