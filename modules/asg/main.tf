resource "aws_autoscaling_group" "asg" {
  name                = "${var.project_name}-asg"
  max_size            = var.max_size
  min_size            = var.min_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  target_group_arns = [var.alb_target_group_arn]
}
