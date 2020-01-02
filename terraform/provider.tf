provider "aws" {
  region  = "us-east-1"
  profile = var.profile
}

terraform {
  backend "s3" {
    bucket         = "tsureshbab-123"
    key            = "sample-app2"
    region         = "us-east-1"
    dynamodb_table = "terraform_locks"
  }
}

variable "profile" {}

variable "env" {}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "MYVPC-${var.env}"
  }

}
