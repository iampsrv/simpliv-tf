resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 10

  tags = {
    Name = "HelloWorld"
  }
}
