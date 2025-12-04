# VPC OUTPUTS

output "vpc_id" {

  value = module.vpc.vpc_id

}
 
output "public_subnets" {

  value = module.vpc.public_subnets

}
 
output "private_subnets" {

  value = module.vpc.private_subnets

}
 

# ECR OUTPUTS

output "backend_ecr_url" {

  value = module.ecr.backend_ecr_url

}
 
output "frontend_ecr_url" {

  value = module.ecr.frontend_ecr_url

}

#IAM OUTPUTS

output "jenkins_role_arn" {
  value = module.iam.jenkins_role_arn
}
 
output "jenkins_instance_profile" {
  value = module.iam.jenkins_instance_profile
}

 
# ECS OUTPUTS
 
output "ecs_cluster_name" {

  value = module.ecs.ecs_cluster_name

}
 
output "ecs_task_execution_role_arn" {

  value = module.ecs.ecs_task_execution_role_arn

}
 
output "backend_log_group" {

  value = module.ecs.backend_log_group

}
 
output "frontend_log_group" {

  value = module.ecs.frontend_log_group

}

 
