resource "aws_launch_template" "lt" {
  image_id      = var.ami_id == "" ? data.aws_ssm_parameter.image_id.value : var.ami_id
  instance_type = var.instance_type
}


data "aws_ssm_parameter" "image_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
