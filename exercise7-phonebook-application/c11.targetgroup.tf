resource "aws_lb_target_group" "terramino" {
  name        = "phonebook-targetgroup"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.aws_default_vpc.default_vpc_id
  target_type = "instance"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 3
    unhealthy_threshold = 3
  }
}

