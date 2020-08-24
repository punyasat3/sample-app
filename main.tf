variable "ami_id" {}
variable "instance_type" {}

variable "root_vl_type" {}
variable "root_vl_size" {}
//variable "root_vl_delete" {}
variable "subnet_id" {}
variable "number_of_instances" {}
variable "sgs" {
   // type = list(string)    
}
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
        root_block_device {
                volume_type           = "${var.root_vl_type}"
                volume_size           = "${var.root_vl_size}"
               //delete_on_termination = "${var.root_vl_delete}"
        }
        tags = {
                 Name = "second333"
                 Role = "user_"
                 Environmaent = "Dev"
        }
        vpc_security_group_ids  = "${var.sgs}"
}
