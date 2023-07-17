terraform {
  required_providers {
    aws = "~> 4.6"
  }
}

provider "aws" {
  region = var.region
}