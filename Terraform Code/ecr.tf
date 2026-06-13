//Create ECR repository
resource "aws_ecr_repository" "container_security_falcon" {
  name                 = var.ecr_repository_name
  image_tag_mutability = var.ecr_image_tag_mutability

//image scanning configuration for ECR repository
  image_scanning_configuration {
    scan_on_push = true
  }

//tagging for ECR repository 
  tags = {
    Name        = var.ecr_repository_name
    Environment = "Production"
    Project     = "Container Security Falcon"
  }
}

