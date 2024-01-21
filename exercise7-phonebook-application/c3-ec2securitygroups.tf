
resource "aws_security_group" "ALBSecurityGroup" {
  name        = "ALBSecurityGroup"
  description = "Enable HTTP for Application Load Balancer"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALBSecurityGroup"
  }
}

resource "aws_security_group" "WebServerSecurityGroup" {
  name        = "WebServerSecurityGroup"
  description = "Enable HTTP for Flask Web Server and SSH for getting into EC2"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description     = "Allow Port 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.ALBSecurityGroup.id]
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServerSecurityGroup"
  }
}

resource "aws_security_group" "MyDBSecurityGroup" {
  name        = "MyDBSecurityGroup"
  description = "MyDBSecurityGroup"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "Allow Port 3306"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.WebServerSecurityGroup.id]
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyDBSecurityGroup"
  }
}

