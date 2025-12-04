# VPC MODULE
module "vpc" {

  source = "./vpc"

}
 


# ECR MODULE


module "ecr" {

  source = "./ecr"

}
 


# IAM MODULE



module "iam" {

  source = "./iam"

}

#ECS Module

module "ecs" {

  source = "./ecs"

  
}

