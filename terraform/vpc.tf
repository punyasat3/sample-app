resource "aws_vpc" "myvpc" {
  cidr_block = lookup(var.vpc_cidr, var.env)
  tags = {
    Name = "MYVPC-${var.env}"
  }

}

resource "aws_subnet" "mysubnet" {
  count             = "${length(lookup(var.subnet_cidr, var.env))}"
  cidr_block        = "${element(lookup(var.subnet_cidr, var.env), count.index)}"
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "${lookup(var.azs, var.env)}"
  tags = {
    Name = "Subnet-${var.env}-${count.index + 1}"
  }

}
