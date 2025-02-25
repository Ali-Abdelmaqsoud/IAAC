provider "aws" {
  region = var.aws_region
}
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_192
  tags = {
    Name = "IAAC_VPC"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_7
  map_public_ip_on_launch = true
  tags = {
    Name = "IAAC_Public_Subnet"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "IAAC_Gateway"
  }
}
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}
  tags = {
    Name = "IAAC_Route"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.RT.id
}
resource "aws_security_group" "SG" {
  name = "Allow_HTTP_SSH"
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "IAAC_SG"
  }
}
  resource "aws_instance" "application_server" {
  ami = var.amazon_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  key_name = var.pem-key
  vpc_security_group_ids = [ aws_security_group.SG.id ]
  tags = {
    Name = "IAAC_Instance"
  }
}
resource "aws_s3_bucket" "data_storage" {
  bucket = "iaac-data-storage"
  tags = {
    Name = "IAAC_S3"
  }
}