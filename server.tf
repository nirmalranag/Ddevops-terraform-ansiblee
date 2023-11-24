terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-02a2af70a66af6dfb"
  instance_type = "t2.micro"
  key_name = "raman-import"

  tags = {
    Name = "Nirmal-DevOps-batch-server"
    env = "Production"
    owner = "Nirmal Rana"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

