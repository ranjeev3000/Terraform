resource "aws_instance" "MyFirstInstance" {
    ami             = lookup(var.AMIS, var.AWS_REGION)
    instance_type   = "t2.micro"

    tags            = {
        Name        = "custom_instance"
    }


}