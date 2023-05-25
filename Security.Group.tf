# Creating SECURITY GROUP
# Resource: aws_security_group
# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/security_group

resource "aws_security_group" "testcase_sg" {
  name        = "testcase_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.testcase_main.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # cidr_blocks = [aws_vpc.testcase_main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPD from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #cidr_blocks = [aws_vpc.testcase_main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPDS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    #cidr_blocks = [aws_vpc.testcase_main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # cidr_blocks = [aws_vpc.testcase_main.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "testcase_sg"
  }
}