# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name          = "my-launch-template"
  description   = "Launch Template of Phone Application"
  image_id      = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.WebServerSecurityGroup.id]
  key_name               = var.instance_keypair
  user_data              = filebase64("${path.module}/app1-install.sh")

}
