resource "aws_ecs_service" "backend_service" {

  name            = "foundation-backend-service"

  cluster         = var.cluster_name

  task_definition = var.backend_task_def_arn

  launch_type     = "FARGATE"

  desired_count   = 1
 
  network_configuration {

    subnets         = var.private_subnets

    security_groups = [var.alb_sg_id]

    assign_public_ip = false

  }
 
  load_balancer {

    target_group_arn = var.backend_tg_arn

    container_name   = "backend"

    container_port   = 5000

  }

}
 
resource "aws_ecs_service" "frontend_service" {

  name            = "foundation-frontend-service"

  cluster         = var.cluster_name

  task_definition = var.frontend_task_def_arn

  launch_type     = "FARGATE"

  desired_count   = 1
 
  network_configuration {

    subnets         = var.private_subnets

    security_groups = [var.alb_sg_id]

    assign_public_ip = false

  }
 
  load_balancer {

    target_group_arn = var.frontend_tg_arn

    container_name   = "frontend"

    container_port   = 80

  }

}

 