output "cluster_name" {

  value = aws_ecs_cluster.foundation_cluster.name

}
 
output "backend_task_def_arn" {

  value = aws_ecs_task_definition.backend_task.arn

}
 
output "frontend_task_def_arn" {

  value = aws_ecs_task_definition.frontend_task.arn

}

 