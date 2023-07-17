resource "aws_autoscaling_group" "asg" {
  name                = "${var.project_name}-asg"
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  target_group_arns = [var.alb_target_group_arn]
}

resource "aws_autoscaling_policy" "asg_scaling_policy" {
  name                   = "${var.project_name}-asg-scaling-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_cpu_value
  }
}
