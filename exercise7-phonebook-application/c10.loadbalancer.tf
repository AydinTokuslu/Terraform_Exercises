resource "aws_lb" "terramino" {
  name               = "lb-phonebook"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = [aws_security_group.ALBSecurityGroup.id]
  subnets            = module.vpc.public_subnets

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "terramino" {
  load_balancer_arn = aws_lb.terramino.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terramino.arn
  }
}
