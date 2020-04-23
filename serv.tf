provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0e38b48473ea57778"
  instance_type = "t2.micro"
  key_name      = "Madaanterra"
  root_block_device {
    volume_size = 8
  }
  tags = {
    Name = var.serve[count.index]
  }
  count = 2
}

variable "serve" {
  type    = list(string)
  default = ["one", "two"]
}

