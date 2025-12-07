resource "aws_ecr_repository" "backend" {

  name                 = "foundation-backend-ecr"

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

  name                 = "foundation-frontend-ecr"

  image_tag_mutability = "MUTABLE"
 
  image_scanning_configuration {

    scan_on_push = true

  }
 
  tags = {

    Project = "Foundation-Day"

    Service = "Frontend"

  }

}

 