resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "myrt"
  }
}

resource "aws_subnet" "mypubsub1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1a"
map_public_ip_on_launch = true
  tags = {
    Name = "mypubsub1"
  }
}

resource "aws_subnet" "mypubsub2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
availability_zone = "us-east-1b"
map_public_ip_on_launch = true
  tags = {
    Name = "mypubsub2"
  }
}
resource "aws_route_table_association" "myrta1" {
  subnet_id      = aws_subnet.mypubsub1.id
  route_table_id = aws_route_table.myrt.id
}
resource "aws_route_table_association" "amyrta2" {
  subnet_id      = aws_subnet.mypubsub2.id
  route_table_id = aws_route_table.myrt.id
}