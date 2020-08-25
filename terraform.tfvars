aws_access_key = "AKIARMDSSSFUYKHGWJAU"
aws_secret_key = "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"
region = "ap-south-1"
ami_id = "ami-0a07be880014c7b8e"
instance_type = "t2.micro"
subnet_id = "subnet-057c487562bdd1c7a" 
root_vl_type = "standard"
root_vl_size = "20"
key_name = "saty"
//number_of_instances =  
user_data = "install_apache.sh"
sgs = ["sg-036a39796e1e75085"]

tags = {"Name":"bat_api", "Environment ":"production"}
