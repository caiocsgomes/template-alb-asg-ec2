variable "project_name" {}
variable "ami_id" {
  default = ""
}
variable "instance_type" {
  default = "t3.micro"
}
variable "region" {
  default = "us-east-1"
}

variable "min_size" {
  default = 1
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "subnet_ids" {
  type = list(string)
}

variable "alb_target_group_arn" {
  type = string
}
