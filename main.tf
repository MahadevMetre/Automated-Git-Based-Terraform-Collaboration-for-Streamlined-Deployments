provider "aws" {
  region = "ap-south-1"  # Specify your desired AWS region
}

resource "aws_instance" "mhdv_instance" {
  ami           = "ami-0d3f444bc76de0a79"  # Specify your desired Amazon Machine Image (AMI)
  instance_type = "t2.micro"      # Specify your desired instance type

  key_name      = "test-ec2"  # Specify the name of your key pair for SSH access

  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_security_group" "instance" {
  name        = "example-instance"
  description = "Security group for the EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere (customize based on your needs)
  }

  # Add more ingress rules for other services as needed

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic (customize based on your needs)
  }

  # Add more egress rules for other services as needed
}
