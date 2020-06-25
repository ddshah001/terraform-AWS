resource "aws_vpc" "main" {
    cidr_block = "10.1.0.0/16"
    instance_tenancy = "dedicated"
    enable_dns_support = "true"
    enable_classiclink = "false"
    tags = {
        Name = "main"
    }
} 