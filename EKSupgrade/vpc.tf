resource "aws_vpc" "eks-vpc" {
  cidr_block       = "192.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "eks-${var.env}-vpc"
    Env  = "${var.env}"
  }

  enable_dns_support   = true
  enable_dns_hostnames = true
}