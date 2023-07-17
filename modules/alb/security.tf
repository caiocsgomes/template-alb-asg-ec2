resource "aws_security_group" "alb_security_group" {
  description = "security group for the alb"
  name        = "${var.alb_name}-alb-sg"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.listener["port"]
    to_port     = var.listener["port"]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.alb_name}-alb-sg"
  }
}
