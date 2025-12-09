module "vpc" {

  source = "./vpc"

}
 
module "ecr" {

  source = "./ecr"

}
 
module "iam" {

  source = "./iam"

}
 
module "ecs" {

  source = "./ecs"
 
  region= var.region

  account_id= var.account_id

  backend_repo_name= module.ecr.backend_repo_name

  frontend_repo_name = module.ecr.frontend_repo_name

}
 
module "alb" {

  source = "./alb"
 
  vpc_id= module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets

}
 
module "ecs_services" {

  source = "./ecs-services"

  cluster_name= module.ecs.cluster_name

  backend_task_def_arn  = module.ecs.backend_task_def_arn

  frontend_task_def_arn = module.ecs.frontend_task_def_arn
 
  backend_tg_arn  = module.alb.backend_tg_arn

  frontend_tg_arn = module.alb.frontend_tg_arn

  alb_sg_id= module.alb.alb_sg_id
 
  private_subnets = module.vpc.private_subnets

}

 