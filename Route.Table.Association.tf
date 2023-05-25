# Creating A Routing Table Association
# Resource: aws_route_table_association

# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/route_table_association

# Provides a resource to create an association between a route table and a subnet.
# a route table and an internet gateway or virtual private gateway.
# Route_table_id - (REQUIRED) The ID of the routing table to associate with.

resource "aws_route_table_association" "rta_a" {
  subnet_id      = aws_subnet.Amazon_Linux_main.id
  route_table_id = aws_route_table.testcase.id
}
resource "aws_route_table_association" "rta_b" {
  subnet_id      = aws_subnet.ubuntu_main.id
  route_table_id = aws_route_table.testcase.id
}

