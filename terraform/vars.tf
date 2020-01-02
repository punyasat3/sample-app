variable "profile" {}

variable "env" {}

variable "vpc_cidr" {
  type = "map"
  default = {
    dev = "10.20.0.0/16"
    e2e = "10.21.0.0/16"
    qa  = "10.22.0.0/16"

  }
}
