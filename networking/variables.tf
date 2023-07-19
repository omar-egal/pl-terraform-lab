# ---networking/variables.tf

variable "vpc_cidr" {}
variable "num_public_subnets" {}
variable "region" {}
variable "public_subnet_name" {
  description = "Name of the public subnets."
  default     = "PublicSubnet"
}
variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}