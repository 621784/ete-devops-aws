variable "backend_repo_name" {
  type        = string
  description = "Backend ECR repo name"
  default     = "foundation-backend-ecr"
}
 
variable "frontend_repo_name" {
  type        = string
  description = "Frontend ECR repo name"
  default     = "foundation-frontend-ecr"
}