terraform {
    backend "s3" {
        bucket = "tfstate786509"
        key = "terraform/first-aws"
        region  = "us-east-2"
    }
}