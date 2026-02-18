provider "aws" {
  region = "us-east-1"   # Change if needed
}

resource "aws_security_group" "ec2_sg" {
  name = "jenkins-ec2-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-0b6c6ebed2801a5cb"   # Amazon Linux (Mumbai)
  instance_type = "t2.micro"
  key_name      = "rrr"      # Change this!

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "EC2-new-server"
  }
}
