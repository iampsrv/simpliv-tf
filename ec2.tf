resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "simpliv"
  subnet_id = aws_subnet.mypubsub1.id
  user_data = file("start.sh")
  security_groups = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_instance" "web1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "simpliv"
  subnet_id = aws_subnet.mypubsub2.id
  security_groups = [aws_security_group.mysg.id]
  user_data = file("start.sh")
  associate_public_ip_address = true
  tags = {
    Name = "prod-ec2"
  }
}