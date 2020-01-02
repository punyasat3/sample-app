variable "profile" {}

variable "env" {}

variable "refion" {
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
    dev = "10.20.0.0/25"
    e2e = "10.21.0.0/25"
    qa  = "10.22.0.0/25"

  }
}
variable "azs" {
  type = map
  default = {
    dev = "us-east-1a"
    e2e = "us-east-1b"
    qa  = "us-east-1c"

  }
}
