# Creating A Subnet 
# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/subnet

resource "aws_subnet" "Amazon_Linux_main" {
  vpc_id                  = aws_vpc.testcase_main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  # AZ for the subnet.

  availability_zone = "eu-west-1a"
  tags = {
    Name = "Amazon-Linux"
  }
}
resource "aws_subnet" "ubuntu_main" {
  vpc_id                  = aws_vpc.testcase_main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"

  # AZ for the subnet.

  availability_zone = "eu-west-1b"
  tags = {
    Name = "Ubuntu-Main"
  }
}
