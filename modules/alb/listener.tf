resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener["port"]
  protocol          = var.listener["protocol"]
  ssl_policy        = var.listener["ssl_policy"]
  certificate_arn   = var.listener["certificate_arn"]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
