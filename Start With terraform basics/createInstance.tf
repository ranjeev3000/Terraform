provider "aws" {
    access_key = "AKIAVJE5QMZV5Q3G46HG"
    secret_key = "SECRET_KEY"
    region = "us-east-2"
}

resource "aws_instance" "MyFirstInstance" {
    ami = "ami-063a9ea2ff5685f7f"
    instance_type = "t2.micro"
}