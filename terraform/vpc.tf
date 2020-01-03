locals {
  subnet_cidrs_list         = lookup(var.subnet_cidr, var.env)
  subnet_cidrs_list_private = lookup(var.subnet_cidr_private, var.env)
  vpc_id                    = aws_vpc.myvpc.id
}





resource "aws_vpc" "myvpc" {
  cidr_block           = lookup(var.vpc_cidr, var.env)
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "MYVPC-${var.env}"
  }

}

resource "aws_subnet" "mysubnet" {
  count                   = "${length(local.subnet_cidrs_list)}"
  cidr_block              = "${element(local.subnet_cidrs_list, count.index)}"
  vpc_id                  = local.vpc_id
  map_public_ip_on_launch = true
  # availability_zone = "${lookup(var.azs, var.env)}"
  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
  tags = {
    Name = "Subnet-Public-${var.env}-${count.index + 1}"
  }

}

resource "aws_subnet" "mysubnet_private" {
  count             = "${length(local.subnet_cidr_private)}"
  cidr_block        = "${element(local.subnet_cidrs_list_private, count.index)}"
  vpc_id            = local.vpc_id
  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
  tags = {
    Name = "Subnet-Private-${var.env}-${count.index + 1}"
  }

}
