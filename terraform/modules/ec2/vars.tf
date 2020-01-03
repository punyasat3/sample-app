variable "instance_type" {
  default = "t2.micro"
}
variable "instance_count" {
  default = 1
}
variable "user_data" {}

variable "associate_public_ip_address" {
  default = true
}

variable "partition_name" {}
variable "vpc_security_group_ids" {}

variable "key_name" {}

variable "subnet_id" {}

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {}
