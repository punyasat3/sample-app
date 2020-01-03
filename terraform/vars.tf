variable "profile" {}

variable "env" {}

variable "region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  type = map
  default = {
    dev = "10.20.0.0/16"
    e2e = "10.21.0.0/16"
    qa  = "10.22.0.0/16"

  }
}

variable "subnet_cidr" {
  type = map
  default = {
    dev = ["10.20.0.0/25", "10.20.1.0/25", "10.20.2.0/25"]
    e2e = ["10.21.0.0/25", "10.21.1.0/25", "10.21.2.0/25"]
    qa  = ["10.22.0.0/25", "10.22.1.0/25", "10.22.2.0/25"]

  }
}
variable "subnet_cidr_private" {
  type = map
  default = {
    dev = ["10.20.3.0/25", "10.20.4.0/25", "10.20.5.0/25"]
    e2e = ["10.21.3.0/25", "10.21.4.0/25", "10.21.5.0/25"]
    qa  = ["10.22.3.0/25", "10.22.4.0/25", "10.22.5.0/25"]

  }
}
# variable "azs" {
#   type = map
#   default = {
#     dev = "us-east-1a"
#     e2e = "us-east-1b"
#     qa  = "us-east-1c"
#
#   }
# }
data "aws_availability_zones" "azs" {}


variable "ami_id" {
  type = "map"
  default = {
    us-east-1 = "ami-00eb20669e0990cb4"
    us-east-2 = "ami-00eb20vsbvjs0990cb4"
    us-west-2 = "ami-00eb20vsbvjs1251725"
  }
}

variable "partition_name" {
  default = "MTS"
}
