# Security Group for the EC2 instance

resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name     = var.key_name
  vpc_security_group_ids = ["sg-0e8b6019756370ee2"]

  tags = {
    Name        = "hello-ec2-instance"
  }
}
