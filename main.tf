module "alb" {
  source      = "./modules/alb"
  alb_name    = var.project_name
  subnets_ids = module.vpc.public_subnet_ids
  vpc_id      = module.vpc.vpc_id
}

module "vpc" {
  source               = "./modules/vpc"
  availability_zones   = var.availability_zones
  vpc_name             = var.project_name
  vpc_cidr             = var.vpc_cidr
  subnet_public_cidrs  = var.subnet_public_cidrs
  subnet_private_cidrs = var.subnet_private_cidrs
}

module "asg" {
  source               = "./modules/asg"
  project_name         = var.project_name
  subnet_ids           = module.vpc.private_subnet_ids
  alb_target_group_arn = module.alb.target_group_arn
  vpc_id               = module.vpc.vpc_id
  user_data            = var.user_data
  alb_sg               = module.alb.alb_sg
  instance_type        = var.instance_type
  min_size             = var.min_size
  target_cpu_value     = var.target_cpu_value
  max_size             = var.max_size
}
