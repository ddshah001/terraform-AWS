variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-2"
}

variable "AWS_AZ" {
    default = {
        us-east-2 = ["us-east-2a","us-east-2b","us-east-2c"]
    }
}

variable "VPC_cidr_block" {
    default = "10.1.0.0/16"
}

variable "public01_cidr_block" {
    default = "10.1.1.0/24"
}
variable "public02_cidr_block" {
    default = "10.1.2.0/24"
}
variable "public03_cidr_block" {
    default = "10.1.3.0/24"
}
variable "private01_cidr_block" {
    default = "10.1.4.0/24"
}
variable "private02_cidr_block" {
    default = "10.1.5.0/24"
}
variable "private03_cidr_block" {
    default = "10.1.6.0/24"
}

variable "AMIS" {
    default = {
        us-east-2 = "ami-083ebc5a49573896a"
        us-east-1 = "ami-01d025118d8e760db"
        us-west-2 = "ami-086b16d6badeb5716"

    }
}

variable "PATH_PUBLIC_KEY" {
    default = "firstkey.pub"
}

variable "PATH_PRIVATE_KEY" {
    default = "firstkey"
}

variable "INSTANCE_USERNAME" {
    default = "ec2-user"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}