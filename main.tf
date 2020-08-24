provider "aws" {
        region = "us-west-2"
}
variable "ami_id" {
  //description = "ami-0873b46c45c11058d"
}
resource "aws_instance" "my-instance" {
        ami = "${var.ami_id}"
        //ami = "ami-0873b46c45c11058d"
        instance_type = "t2.micro"
        key_name = "satya"
        user_data = "${file("install_apache.sh")}"
        tags = {
                 Name = "second2"
                 Role = "cms_"
                 Environmaent = "production"
        }
}
