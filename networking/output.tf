# ---networking/output.tf

output "vpc_id" {
  value = aws_vpc.lab_vpc.id
}