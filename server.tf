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
  ami = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"
  key_name = "terraform-import"

  tags = {
    Name = "Nirmal-DevOps-batch-server"
    env = "Production"
    owner = "Nirmal Rana"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

