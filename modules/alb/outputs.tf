output "listener_arn" {
  value = aws_lb_listener.listener.arn
}

output "alb_sg" {
  value = aws_security_group.alb_security_group.id
}

output "dns_name" {
  value = aws_lb.alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}
