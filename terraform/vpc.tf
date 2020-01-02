resource "aws_vpc" "myvpc" {
  cidr_block = lookup(var.vpc_cidr, var.env)
  tags = {
    Name = "MYVPC-${var.env}"
  }

}

resource "aws_subnet" "mysubnet" {
  cidr_block        = lookup(var.subnet_cidr, var.env)
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = lookup(var.azs, var.env)
  tags = {
    Name = "Subnet-${var.env}"
  }

}
