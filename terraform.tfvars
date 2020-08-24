aws_access_key = "AKIARMDSSSFU3W7WD7GZ"
aws_secret_key = "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"
region = "ap-south-1"
ami_id = "ami-0ebc1ac48dfd14136"
instance_type = "t2.micro"
subnet_id = "subnet-057c487562bdd1c7a" 
root_vl_type = "gp2"
root_vl_size = "8"
key_name = "saty"
//number_of_instances =  
user_data = "install_apache.sh"
sgs = ["sg-036a39796e1e75085"]

tags = {"Name":"bat_api", "Environment ":"production"}
