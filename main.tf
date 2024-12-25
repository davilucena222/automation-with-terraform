terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e2c8caa4b6378d8c" # ubuntu server image 
  instance_type = "t2.micro"
  key_name = "iac-aws-terraform"
  # user_data = <<-EOF
  #                #!/bin/bash
  #                cd /home/ubuntu
  #                echo "<h1>Deployed via Terraform IaC</h1>" > index.html
  #                nohup busybox httpd -f -p 8080 &
  #                EOF
  tags = {
    Name = "AWS VM with Python and Virtualenv"
  }
}