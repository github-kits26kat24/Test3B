# Creating A VPC
# Resource: aws_vpc
# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/vpc

resource "aws_vpc" "testcase_main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "Testcase"
  }
}

output "Vpc_id" {
  value = aws_vpc.testcase_main.id
}