# template-alb-asg-ec2

Terraform module to create an ALB with an ASG attached to the ALB's target group. The ASG will create the EC2 instances and scale based on CPU utilization. Besides this it uses health checks to check if the instances are healthy and if not it will terminate the instance and create a new one. This is the architecture of the module:

![Architecture](https://github.com/caiocsgomes/template-alb-asg-ec2/blob/assets/architecture.png)


## Variables 

```hcl

variable "project_name" {}

variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_public_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnet_private_cidrs" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "user_data" {
  default = ""
}

variable "instance_type" {
  default = "t3.micro"
}

variable "min_size" {
  default = 1
}

variable "target_cpu_value" {
  default = 50.0
}

variable "max_size" {
  default = 3
}
```

## Usage

There is an example in the `examples` folder. To run it, execute:

```sh
terraform init
terraform plan
terraform apply
```