# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.webserver1.id]
  tags = {
    "Name" = "Roman Numerals Converter"
  }
}

module "aws_default_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"
  name = "default"
  public_subnets = aws_default_vpc.default.id
  azs = aws_default_vpc.default
}



