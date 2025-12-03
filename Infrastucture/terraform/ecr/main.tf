resource "aws_ecr_repository" "backend" {

  name = var.backend_repo_name

  image_tag_mutability = "MUTABLE"
 
  image_scanning_configuration {

    scan_on_push = true

  }
 
  tags = {

    Project = "Foundation-Day"

    Service = "Backend"

  }

}
 
resource "aws_ecr_repository" "frontend" {

  name = var.frontend_repo_name

  image_tag_mutability = "MUTABLE"
 
  image_scanning_configuration {

    scan_on_push = true

  }
 
  tags = {

    Project = "Foundation-Day"

    Service = "Frontend"

  }

}

 