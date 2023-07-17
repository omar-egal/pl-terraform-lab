# ---networking/main.tf

resource "random_integer" "random" {
  min = 1
  max = 100
}
resource "aws_vpc" "lab_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "test_vpc-${random_integer.random.id}"
  }
}

