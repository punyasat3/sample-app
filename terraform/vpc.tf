locals {
  subnet_cidrs_list = lookup(var.subnet_cidr, var.env)
}





resource "aws_vpc" "myvpc" {
  cidr_block = lookup(var.vpc_cidr, var.env)
  tags = {
    Name = "MYVPC-${var.env}"
  }

}

resource "aws_subnet" "mysubnet" {
  count             = "${length(local.subnet_cidrs_list)}"
  cidr_block        = "${element(local.subnet_cidrs_list, count.index)}"
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "${lookup(var.azs, var.env)}"
  tags = {
    Name = "Subnet-${var.env}-${count.index + 1}"
  }

}
