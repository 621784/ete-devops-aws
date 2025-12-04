output "ecs_cluster_name" {

  value = aws_ecs_cluster.foundation_cluster.name

}
 
output "ecs_task_execution_role_arn" {

  value = aws_iam_role.ecs_task_execution_role.arn

}
 
output "backend_log_group" {

  value = aws_cloudwatch_log_group.backend_logs.name

}
 
output "frontend_log_group" {

  value = aws_cloudwatch_log_group.frontend_logs.name

}

 