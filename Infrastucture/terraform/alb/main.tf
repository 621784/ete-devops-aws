resource "aws_security_group" "alb" {
  vpc_id = var.vpc_id
 
  ingress {
    from_port= 80
    to_port= 80
    protocol= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port= 0
    to_port= 0
    protocol= "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 
resource "aws_lb" "this" {
  name= "foundation-alb"
  load_balancer_type = "application"
  subnets= var.public_subnets
  security_groups= [aws_security_group.alb.id]
}
 
resource "aws_lb_target_group" "backend" {
  port= 5000
  protocol= "HTTP"
  target_type = "ip"
  vpc_id= var.vpc_id
}
 
resource "aws_lb_target_group" "frontend" {
  port= 80
  protocol= "HTTP"
  target_type = "ip"
  vpc_id= var.vpc_id
}
 
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port = 80
  protocol = "HTTP"
 
  default_action {
    type= "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}

resource "aws_lb_listener_rule" "backend_rule" {

  listener_arn = aws_lb_listener.http.arn

  priority= 10
 
  condition {

    path_pattern {

      values = ["/api/*"]

    }

  }
 
  action {

    type= "forward"

    target_group_arn = aws_lb_target_group.backend.arn

  }

}

 