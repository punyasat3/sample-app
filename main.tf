variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "number_of_instances" {}
variable "user_data" {}
variable "key_name" {}
variable "region" {}
//variable "vpc_id" {}


provider "aws" {
        region = "${var.region}"
}
resource "aws_instance" "my-instance" {
        ami = "${var.ami_id}"
        instance_type = "${var.instance_type}"
        subnet_id          = "${var.subnet_id}"
        key_name =  "${var.key_name}"
        user_data = "${file(var.user_data)}"
        tags = {
                 Name = "second333"
                 Role = "user_"
                 Environmaent = "Dev"
        }
}
