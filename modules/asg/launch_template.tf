resource "aws_launch_template" "lt" {
  image_id               = var.ami_id == "" ? data.aws_ssm_parameter.image_id.value : var.ami_id
  instance_type          = var.instance_type
  user_data              = base64encode(var.user_data)
  vpc_security_group_ids = [aws_security_group.sg.id]
  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    device_index                = 0
  }
}


data "aws_ssm_parameter" "image_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
