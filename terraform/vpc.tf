resource "aws_vpc" "myvpc" {
  cidr_block = "${lookup(var.vpc_cidr, var.env)}"
  tags = {
    Name = "MYVPC-${var.env}"
  }

}
