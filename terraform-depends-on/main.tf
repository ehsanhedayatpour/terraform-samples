provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket-for-import"
  tags = {
    "name" = "my-bucket"
  }
}

resource "aws_instance" "example-ec2" {
  ami           = "ami-0361026b1164be8a2"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2 Instance"
  }
  depends_on = [aws_s3_bucket.my_bucket]
}
