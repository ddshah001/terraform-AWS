resource "aws_eip" "nat-eip" {
    vpc = true
}

resource "aws_nat_gateway" "main-nat-gw" {
    allocation_id = aws_eip.nat-eip.id
    subnet_id = aws_subnet.main-public01.id
    depends_on = [aws_internet_gateway.main-gw]
}

resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-nat-gw.id
  }

  tags = {
    Name = "main-private-1"
  }
}

resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = aws_subnet.main-private01.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-2-a" {
  subnet_id      = aws_subnet.main-private02.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-3-a" {
  subnet_id      = aws_subnet.main-private03.id
  route_table_id = aws_route_table.main-private.id
}