locals {
  is_t_instance_type = replace(var.instance_type, "/^t(2|3|3a){1}\\..*$/", "1") == "1" ? true : false
}
provider "aws" {
        region = "us-west-2"
}

resource "aws_instance" "my-instance" {
        ami = var.ami
        instance_type = "t2.micro"
        key_name = "satya"
        user_data = "${file("install_apache.sh")}"
        tags = {
                 Name = "sztyatags"
                 Role = "cms_"
                 Environmaent = "production"
        }
}
