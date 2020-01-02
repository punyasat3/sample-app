resource "aws_vpc" "myvpc" {
  cidr_block = lookup(var.vpc_cidr, var.env)
  tags = {
    Name = "MYVPC-${var.env}"
  }

}

resource "aws_subnet" "mysubnet" {
  count             = length(var.azs)
  cidr_block        = "${element(var.subnet_cidr[count.index], var.env)}"
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "${lookup(var.azs, var.env)}"
  tags = {
    Name = "Subnet-${var.env}"
  }

}
