# ECS Cluster
resource "aws_ecs_cluster" "foundation_cluster" {
  name = "foundation-day-cluster"
 
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
 

# CloudWatch Log Groups

resource "aws_cloudwatch_log_group" "backend_logs" {
  name              = "/ecs/foundation-backend"
  retention_in_days = 7
}
 
resource "aws_cloudwatch_log_group" "frontend_logs" {
  name              = "/ecs/foundation-frontend"
  retention_in_days = 7
}

# ECS Task Execution Role

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole-foundation"
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
      Effect    = "Allow"
    }]
  })
}
 
resource "aws_iam_role_policy_attachment" "ecs_exec_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}