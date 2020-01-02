resource "aws_vpc" "myvpc" {
  cidr_block = lookup(var.vpc_cidr, var.env)
  tags = {
    Name = "MYVPC-${var.env}"
  }

}

resource "aws_subnet" "mysubnet" {
  count             = "${length(var.azs)}"
  cidr_block        = "${lookup(var.subnet_cidr, lookup(var.env, count.index))}"
  lookup(var.route_tables, lookup(var.vpc_id, var.env))
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "${element(var.azs, count.index)}"
  tags = {
    Name = "Subnet-${var.env}"
  }

}
