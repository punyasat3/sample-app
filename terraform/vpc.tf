#######Declaring Local variables########
locals {
  subnet_cidrs_list         = lookup(var.subnet_cidr, var.env)
  subnet_cidrs_list_private = lookup(var.subnet_cidr_private, var.env)
  vpc_id                    = aws_vpc.myvpc.id
}
#########################################

#######VPC###############################
resource "aws_vpc" "myvpc" {
  cidr_block           = lookup(var.vpc_cidr, var.env)
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "MYVPC-${var.env}"
  }

}
#########################################

###############Public Subnet#############
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
#########################################

###############Private Subnet#############
resource "aws_subnet" "mysubnet_private" {
  count             = "${length(local.subnet_cidrs_list_private)}"
  cidr_block        = "${element(local.subnet_cidrs_list_private, count.index)}"
  vpc_id            = local.vpc_id
  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
  tags = {
    Name = "Subnet-Private-${var.env}-${count.index + 1}"
  }

}
#########################################

###############IGW#######################
resource "aws_internet_gateway" "my_igw" {
  vpc_id = local.vpc_id
  tags = {
    Name = "MYVPC-IGW-${var.env}"
  }
}
#########################################


#############Public Route Tables#########
resource "aws_route_table" "public_rt" {
  vpc_id = local.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.my_igw.id}"
  }

  tags = {
    Name = "MyVPC-Public-RT-${var.env}"
  }
}
#########################################


#############Private Route Tables for Dev#########
resource "aws_route_table" "private_rt_dev" {
  count  = "${var.env == "dev" ? 1 : 0}"
  vpc_id = local.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gateway.*.id[0]}"
  }

  tags = {
    Name = "MyVPC-Private-RT-${var.env}"
  }
}
#########################################

#############Private Route Tables for Except Dev#########
resource "aws_route_table" "private_rt_except_dev" {
  count  = "${var.env == "dev" ? 0 : 1}"
  vpc_id = local.vpc_id

  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = "${aws_nat_gateway.nat_gateway.*.id[0]}"
  # }

  tags = {
    Name = "MyVPC-Private-RT-${var.env}"
  }
}
#########################################

#############Public Route Association#########
resource "aws_route_table_association" "public_association" {
  count          = "${length(local.subnet_cidrs_list)}"
  subnet_id      = "${aws_subnet.mysubnet.*.id[count.index]}"
  route_table_id = aws_route_table.public_rt.id
}
##############################################


#############Private Route Association#########
resource "aws_route_table_association" "private_association" {
  count          = "${length(local.subnet_cidrs_list_private)}"
  subnet_id      = "${aws_subnet.mysubnet_private.*.id[count.index]}"
  route_table_id = aws_route_table.private_rt_dev.id
}
#################################################


##################EIP for DEV####################
resource "aws_eip" "dev_eip" {
  vpc   = true
  count = "${var.env == "dev" ? 1 : 0}"
  tags = {
    Name = "EIP-${var.env}"
  }
}
###################################################


##################NAT GateWay for DEV#################
resource "aws_nat_gateway" "nat_gateway" {
  count         = "${var.env == "dev" ? 1 : 0}"
  allocation_id = "${aws_eip.dev_eip.*.id[0]}"
  subnet_id     = "${aws_subnet.mysubnet.*.id[0]}"

  tags = {
    Name = "MYVPC-NAT-GATEWAY-${var.env}"
  }
}
###################################################
