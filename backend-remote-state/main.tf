provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-s3-bucket"
    key    = "terraform/remote/s3/terraform.tfstate"
    region = "us-east-1"
  }
}


resource "aws_instance" "example-ec2" {

  ami = "ami-0124046e1316be4b9"

  instance_type = "t2.micro"

  tags = {
    Name = "EC2 Instance with backend remote state"
  }
}