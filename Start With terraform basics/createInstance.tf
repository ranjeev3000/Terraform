
resource "aws_instance" "MyFirstInstance" {
    ami = "ami-063a9ea2ff5685f7f"
    instance_type = "t2.micro"
}