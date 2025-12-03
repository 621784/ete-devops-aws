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

