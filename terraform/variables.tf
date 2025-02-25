variable "aws_region" {  
  default = "us-east-1"  
}
variable "amazon_ami" {
  default = "ami-05b10e08d247fb927"
}
variable "instance_type" {  
  default = "t2.micro"
}
variable "vpc_192" {
  default = "192.168.0.0/16"
}
variable "subnet_7" {  
  default = "192.168.7.0/24"
}
variable "pem-key" {
  default = "Fedora-DevOps"
}