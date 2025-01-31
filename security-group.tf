resource "aws_security_group" "public-allow-ssh" {
    vpc_id = aws_vpc.main.id
    name = "public-allow-ssh"
    description = "allow ssh on public subnets and provide internet to instance"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "public-allow-ssh"
    }
  
}