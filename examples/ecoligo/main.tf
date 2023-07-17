module "asg" {
  source       = "git::https://github.com/caiocsgomes/template-alb-asg-ec2"
  project_name = var.project_name
  region       = var.region
  user_data    = var.user_data
}
