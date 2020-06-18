variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-2"
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
