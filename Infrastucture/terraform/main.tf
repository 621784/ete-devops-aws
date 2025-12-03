# ROOT MODULE - CALLING ALL CHILD MODULES
# VPC Module

module "vpc" {

  source = "./vpc"

}


# ECR Module

module "ecr" {

  source = "./ecr"

}

