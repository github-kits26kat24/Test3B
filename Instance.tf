# Creating An EC2 Instance

# Resource: aws_instance
# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/instance
resource "aws_instance" "Amazon-Linux-App" {
  ami                    = "ami-04f7efe62f419d9f5"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.Amazon_Linux_Main.id
  vpc_security_group_ids = [aws_security_group.testcase_sg.id]
  # count                  = 1
  key_name = "Kitskat2023"

  #   # https://cloudkatha.com/how-to-install-apache-web-server-on-amazon-linux-2/?utm_content=cmp-true

  #   # Update the latest package available on the system
  #   # Install Apache Web Server
  #   # Start Apache Server
  #   # The above command will install the a/pache web server but it will not start it. You need to explicitly start the server using the below command
  #   # Configure Apache to run on system boot
  #   # You can do so by the below command

  user_data = <<EOF
#!/bin/bash
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl status httpd
sudo yum systemctl enable httpd.service
EOF

  tags = {
    Name = "Amazon-Linux"
  }
}

resource "aws_instance" "Redhat-App" {
  ami                    = "ami-013d87f7217614e10"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.Redhat_Main.id
  vpc_security_group_ids = [aws_security_group.testcase_sg.id]
  # count                  = 1
  key_name = "Kitskat2023"

  #   # https://cloudkatha.com/how-to-install-apache-web-server-on-amazon-linux-2/?utm_content=cmp-true

  #   # Update the latest package available on the system
  #   # Install Apache Web Server
  #   # Start Apache Server
  #   # The above command will install the a/pache web server but it will not start it. You need to explicitly start the server using the below command
  #   # Configure Apache to run on system boot
  #   # You can do so by the below command

  user_data = <<EOF
#!/bin/bash
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl status httpd
sudo yum systemctl enable httpd.service
EOF

  tags = {
    Name = "Redhat-Linux"
  }
}
resource "aws_instance" "Ubuntu-App" {
  ami                    = "ami-01dd271720c1ba44f"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.Ubuntu_Main.id
  vpc_security_group_ids = [aws_security_group.testcase_sg.id]
  # count                  = 1
  key_name = "Kitskat2023"

  # https://cloudkatha.com/how-to-install-apache-2-on-aws-ec2-instance-ubuntu-20-04/

  # # Update the latest package available on the system
  # Install Apache Web Server
  #Verify Apache Installation
  # Check Apache Server Status

  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
apache2 -version
sudo systemctl status apache2
EOF

  tags = {
    Name = "Ubuntu"
  }
}