# Creating A Routing Table 
# Resource: aws_route_table

# A route Is Used To Determine Where Network Traffic From The Subnet or Gateway Is Directed.
# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/route_table

resource "aws_route_table" "testcase" {
  # The Vpc Id
  vpc_id = aws_vpc.testcase_main.id

  route {
    cidr_block = "0.0.0.0/0"

    #  Gateway_ID Identifier Of A Vpc Internet Gateway Or A Vitual Private Gateway.

    gateway_id = aws_internet_gateway.igw.id
  }

  # A Map Of Tags To Assign To The Resources.

  tags = {
    Name = "Internet-Gateway-Example"
  }
}



