# Security Group for levelupvpc
resource "aws_security_group" "allow-levelup-ssh" {
  description = "Allow TLS inbound traffic"
  name = "allow-levelup-ssh"
  vpc_id      = aws_vpc.levelup_vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-levelup-ssh"
  }
}

# Security Group for MariaDB
resource "aws_security_group" "allow-mariadb" {
  description = "Security Group for Maria DB"
  vpc_id      = aws_vpc.levelup_vpc.id
  name = "allow-mariadb"

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.allow-levelup-ssh.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-mariadb"
  }
}