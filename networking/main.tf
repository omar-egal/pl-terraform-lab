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

# Declare the data source for available AZs
data "aws_availability_zones" "available" {
  state = "available"
}

/*resource "random_shuffle" "availability_zones_list" {
  input        = data.aws_availability_zones.available.names
  result_count = var.max_subnets
}*/

resource "aws_subnet" "public_subnet" {
  count             = var.num_public_subnets
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = "10.0.${count.index + 1}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  /*  availability_zone = random_shuffle.availability_zones_list.result[count.index]*/
  tags = merge(var.tags, {
    Name = "${var.public_subnet_name}-subnet-${count.index + 1}"
  })
}