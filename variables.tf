// Module specific variables

//variable "instance_name" {
//  description = "satyainstance"
//}

variable "instance_type" {
  description = "t2.micro"
}

//variable "subnet_id" {
  //description = "The VPC subnet the instance(s) will go in"
//}

variable "ami_id" {
  description = "ami-0873b46c45c11058d"
}

variable "number_of_instances" {
  description = "1"
  default = 1
}

//variable "user_data" {
 // description = "The path to a file with user_data for the instances"
//}

//variable "tags" {
 // default = {
  //  created_by = "terraform"
 //}
//}

// Variables for providers used in this module
//variable "aws_access_key" {}
//variable "aws_secret_key" {}
//variable "aws_region" {}
