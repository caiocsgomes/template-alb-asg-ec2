resource "aws_lb" "alb" {
  name               = var.alb_name
  load_balancer_type = "application"
  internal           = false
  subnets            = var.subnets_ids
  security_groups    = [aws_security_group.alb_security_group.id]
}
