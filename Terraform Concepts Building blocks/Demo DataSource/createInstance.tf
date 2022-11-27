data "aws_availability_zone "available" {} 

resource "aws_instance" "MyFirstInstance" {
    ami             = lookup(var.AMIS, var.AWS_REGION)
    instance_type   = "t2.micro"
    availability_zone = data.aws_availability_zone.available.names[1]

    tags            = {
        Name        = "custom_instance"
    }


}