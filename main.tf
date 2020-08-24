variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "number_of_instances" {}
variable "user_data" {}
//variable "vpc_id" {}


provider "aws" {
        region = "us-west-2"
}
resource "aws_instance" "my-instance" {
        ami = "${var.ami_id}"
        //ami = "ami-0873b46c45c11058d"
        instance_type = "t2.micro"
        subnet_id          = "${var.subnet_id}"
        key_name = "satya"
        user_data = "${file(var.user_data)}"
        tags = {
                 Name = "second333"
                 Role = "user_"
                 Environmaent = "Dev"
        }
}
