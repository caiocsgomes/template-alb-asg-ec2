variable "alb_name" {}
variable "vpc_id" {}
variable "subnets_ids" {
  type = list(any)
}
variable "listener" {
  type = map(any)
  default = {
    port            = "80"
    protocol        = "HTTP"
    ssl_policy      = ""
    certificate_arn = ""
  }
}

variable "instance_port" {
  type    = number
  default = 80
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_path" {
  type    = string
  default = "/"
}