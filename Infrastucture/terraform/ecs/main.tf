resource "aws_ecs_cluster" "foundation_cluster" {
  name = "foundation-day-cluster"
}
 
resource "aws_cloudwatch_log_group" "backend_logs" {
  name = "/ecs/foundation-backend"
}
 
resource "aws_cloudwatch_log_group" "frontend_logs" {
  name = "/ecs/foundation-frontend"
}
 
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole-foundation"
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}
 
resource "aws_iam_role_policy_attachment" "ecs_exec_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
 
resource "aws_ecs_task_definition" "backend_task" {
  family                   = "foundation-backend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
 
  container_definitions = jsonencode([{
    name  = "backend"
    image = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.backend_repo_name}:latest"
    essential = true
 
    portMappings = [{
      containerPort = 5000
      protocol      = "tcp"
    }]
 
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/foundation-backend"
        awslogs-region        = var.region
        awslogs-stream-prefix = "backend"
      }
    }
  }])
}
 
resource "aws_ecs_task_definition" "frontend_task" {
  family                   = "foundation-frontend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
 
  container_definitions = jsonencode([{
    name  = "frontend"
    image = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.frontend_repo_name}:latest"
    essential = true
 
    portMappings = [{
      containerPort = 80
      protocol      = "tcp"
    }]
 
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/foundation-frontend"
        awslogs-region        = var.region
        awslogs-stream-prefix = "frontend"
      }
    }
  }])
}