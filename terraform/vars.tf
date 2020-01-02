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
variable "azs" {
  default = ["us-east-1a", "us-east-1a", "us-east-1a"]
}