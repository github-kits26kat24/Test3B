
resource "aws_lb" "test3b_load_balancer" {
  name               = "Test3B-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.testcase_sg.id]
  subnets            = [aws_subnet.Amazon_Linux_Main.id, aws_subnet.Redhat_Main.id, aws_subnet.Ubuntu_Main.id]

  enable_deletion_protection = false
  tags = {
    Environment = "dev"
  }
}
resource "aws_lb_listener" "test3b_front_end" {
  load_balancer_arn = aws_lb.test3b_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test3b.arn
  }
}
resource "aws_lb_target_group" "test3b" {
  name     = "Test3B-Load-Balancer-Taget-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.testcase_main.id
}

resource "aws_lb_target_group_attachment" "test3b-1" {
  target_group_arn = aws_lb_target_group.test3b.arn
  target_id        = aws_instance.Amazon-Linux-App.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test3b-2" {
  target_group_arn = aws_lb_target_group.test3b.arn
  target_id        = aws_instance.Redhat-App.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test3b-3" {
  target_group_arn = aws_lb_target_group.test3b.arn
  target_id        = aws_instance.Ubuntu-App.id
  port             = 80
}



