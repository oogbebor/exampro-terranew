terraform  {
backend "remote" {
 hostname  = "app.terraform.io"
 organization  = "learn0622"

 workspaces  {
   name  = "exampro-terranew"
 }
}
required_providers {
      aws = {
      source  = "hashicorp/aws"
      version = "~> 3.8"
    }
  }
}


data "aws_vpc" "main"  {
      id  = "vpc-0fbcb74e68dd273f2"
}


provider "aws" {
        profile = "default"
        region  = "us-east-2"
}

resource "aws_instance" "exampro_instance" {
  ami           = "ami-00978328f54e31526"
  instance_type = "t2.micro"
  key_name = var.key_name
  security_groups = [var.security_group]
  tags = {
    Name = var.tag_name
  }
}

#Create security group with firewall rules
resource "aws_security_group" "security_prvisioners_grp" {
  name        = "prvisioners_security_group"
  description = "security group for prvisioners"
  vpc_id  =  data.aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = []
    prefix_list_ids  = []
    security_groups  = []
    self  = false
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = []
    prefix_list_ids  = []
    security_groups  = []
    self  = false
  }


# outbound from  server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = []
    prefix_list_ids  = []
    security_groups  = []
    self  = false
  }

  tags= {
    Name = var.security_group 
    }
}
