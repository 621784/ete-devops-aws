# VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}
 
output "public_subnets" {
  value = module.vpc.public_subnets
}
 
output "private_subnets" {
  value = module.vpc.private_subnets
}
 
# ECR
output "backend_ecr_url" {
  value = module.ecr.backend_ecr_url
}
 
output "frontend_ecr_url" {
  value = module.ecr.frontend_ecr_url
}
 
# ECS
output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}
 
output "backend_task_def_arn" {
  value = module.ecs.backend_task_def_arn
}
 
output "frontend_task_def_arn" {
  value = module.ecs.frontend_task_def_arn
}
 
# ALB
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
 
output "backend_tg_arn" {
  value = module.alb.backend_tg_arn
}
 
output "frontend_tg_arn" {
  value = module.alb.frontend_tg_arn
}
 
# ECS Services
output "backend_service_name" {
  value = module.ecs_services.backend_service_name
}
 
output "frontend_service_name" {
  value = module.ecs_services.frontend_service_name
}