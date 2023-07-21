terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

module "networking" {
  source             = "./networking"
  vpc_cidr           = "10.16.0.0/16"
  num_public_subnets = 2
  #  max_subnets        = 20
  region = var.aws_region
}