# Autoscaling Group Resource
resource "aws_autoscaling_group" "my_asg" {
  name_prefix         = "myasg"
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  
  vpc_zone_identifier  = aws_lb.terramino.subnets
  
  target_group_arns         = [aws_lb_target_group.terramino.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 90 # default is 300 seconds  
  # Launch Template
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }
  
}
