provider "aws" {
        region = "us-west-2"
}

resource "aws_instance" "my-instance" {
        ami = "ami-0873b46c45c11058d"
        instance_type = "t2.micro"
        key_name = "satya"
        user_data = "${file("install_apache.sh")}"
        tags = {
                Name = $name
                Role = "cms_"
                Environmaent = "production"
        }
}
