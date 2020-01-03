variable "sg_name" {}
variable "vpc_id" {}
variable "port1" {}
variable "port2" {}
variable "protocol_name" {}
variable "partition_name" {}
variable "env" {}
variable "cidr_blocks" {
  default = "0.0.0.0/0"
}
