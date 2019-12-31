provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "tsureshbab-123"
    key            = "sample-app"
    region         = "us-east-1"
    dynamodb_table = "terraform_locks"
  }
}
resource "aws_vpc" "myvpc" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "MYVPC"
  }
    
}
