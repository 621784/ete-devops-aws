variable "cluster_name" {}

variable "backend_task_def_arn" {}

variable "frontend_task_def_arn" {}

variable "backend_tg_arn" {}

variable "frontend_tg_arn" {}

variable "alb_sg_id" {}

variable "private_subnets" {
    type = list(string)
}

 