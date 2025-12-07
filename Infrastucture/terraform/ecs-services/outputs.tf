output "backend_service_name" {
  value = aws_ecs_service.backend_service.name
}
 
output "frontend_service_name" {
  value = aws_ecs_service.frontend_service.name
}