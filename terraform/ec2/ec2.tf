resource "aws_instance" "bastion" {
  ami           = var.ami 
  instance_type = var.instance_type
  vpc = 
  subnet = 

  tags = {
    Name = "HelloWorld"
  }
}

