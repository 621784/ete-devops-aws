output "backend_tg_arn" {

  value = aws_lb_target_group.backend.arn

}
 
output "frontend_tg_arn" {

  value = aws_lb_target_group.frontend.arn

}
 
output "alb_sg_id" {

  value = aws_security_group.alb.id

}
 
output "alb_dns_name" {

  value = aws_lb.this.dns_name

}

 