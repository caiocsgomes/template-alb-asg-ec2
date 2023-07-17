resource "aws_lb_target_group" "tg" {
  name     = "${var.alb_name}-tg"
  port     = var.instance_port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}
