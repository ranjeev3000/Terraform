resource "aws_key_pair" "levelup_key" {
  key_name = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}


resource "aws_instance" "MyFirstInstance" {
    ami             = lookup(var.AMIS, var.AWS_REGION)
    instance_type   = "t2.micro"
    key_name = aws_key_pair.levelup_key.key_name

    user_data = file("installapache.sh")


    tags            = {
        Name        = "custom_instance"
    }

}

# EBS Resource Creation

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-2a"
  size              = 40
  type = "gp2"

  tags = {
    Name = "HelloWorld"
  }
}

# Attach EWS Volume with AWS Instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.MyFirstInstance.id
}