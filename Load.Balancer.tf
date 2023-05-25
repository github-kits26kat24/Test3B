
resource "aws_lb" "test3b_load_balancer" {
  name               = "Test3B-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.testcase_sg.id]
  subnets            = [aws_subnet.Amazon_Linux_main.id, aws_subnet.ubuntu_main.id]

  enable_deletion_protection = false

  # access_logs {
  #   bucket  = aws_s3_bucket.project03.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_listener" "test3b_front_end_1" {
  load_balancer_arn = aws_lb.test3b_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test3b-1.arn
  }
}
resource "aws_lb_listener" "test3b_front_end_2" {
  load_balancer_arn = aws_lb.test3b_load_balancer.arn
  port              = "443"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test3b-2.arn
  }
}

resource "aws_lb_target_group" "test3b-1" {
  name     = "Test3B-lb-tg-Instance-Amazon-LX"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.testcase_main.id
}

resource "aws_lb_target_group" "test3b-2" {
  name     = "Test3B-lb-tg-Instance-Ubuntu"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.testcase_main.id
}

resource "aws_lb_target_group_attachment" "test3b-1" {
  target_group_arn = aws_lb_target_group.test3b-1.arn
  target_id        = aws_instance.Amazon-Linux-App.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "test3b-2" {
  target_group_arn = aws_lb_target_group.test3b-2.arn
  target_id        = aws_instance.Amazon-Linux-App.id
  port             = 80
}



