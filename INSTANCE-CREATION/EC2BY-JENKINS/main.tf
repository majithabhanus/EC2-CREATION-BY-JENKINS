provider "aws" {
  region = "us-east-1"   # Mumbai region (change if needed)
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0b6c6ebed2801a5cb"   # Amazon Linux 2 (ap-south-1)
  instance_type = "t2.micro"

  key_name = "rrr"   # replace with your keypair

  tags = {
    Name = "Jenkins-EC2"
  }
}
