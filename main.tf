provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "zapcom_ec2" {
  ami           = "ami-0440d3b780d96b29d"  # Amazon Linux 2 AMI in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name            = "Zapcom-EC2"
    Account_Project = "Zapcom_JenkinsCI"
  }
}
