#  RDS Resources
resource "aws_db_subnet_group" "mariadb-subnets" {
  name       = "mariadb-subnet"
  description = "Amazon RDS Subnet group"
  subnet_ids = [aws_subnet.levelupvpc-private-1.id, aws_subnet.levelupvpc-private-2.id]
}


# RDS Parameters
resource "aws_db_parameter_group" "levelup-mariadb-parameters" {
  name   = "levelup-mariadb-parameters"
  family = "mariadb10.6"
  description = "MAriaDB Parameter Group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }

}

# RDS Instance Properties
resource "aws_db_instance" "levelup-mariadb" {
  allocated_storage     = 20     #20 GB of storage
  engine                = "mariadb"
  engine_version        = "10.6.8"   #Use micro if you want to use free version
  instance_class        = "db.t3.micro"
  identifier            = "mariadb"
  name                  = "mariadb"
  username              = "root"       #username
  password              = "mariadb141"
  db_subnet_group_name  = aws_db_subnet_group.mariadb-subnets.name
  parameter_group_name  = aws_db_parameter_group.levelup-mariadb-parameters.name
  multi_az              = "false"     # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
  storage_type = "gp2"
  backup_retention_period = 30         # How long you are going to keep your backups
  availability_zone = aws_subnet.levelupvpc-private-1.availability_zone   #Preferred AZ
  skip_final_snapshot   = true    #skip final snapshots when doing terraform destroy
  tags  = {
      Name = "levelup-mariadb"
  }
}

output "rds" {
  value = aws_db_instance.levelup-mariadb.endpoint
}