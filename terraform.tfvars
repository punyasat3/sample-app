region = "us-west-2"
ami_id = "ami-0873b46c45c11058d"
instance_type = "t2.micro"
subnet_id = "subnet-02657630f36e06778" 
root_vl_type = "gp2"
root_vl_size = "8"
key_name = "satya"
//number_of_instances =  
user_data = "install_apache.sh"
sgs = ["sg-05711d6d6baa46ec4"]
tag_name = "tagupdated"

tags = {"Name":"batya", "Environment ":"oduction"}
