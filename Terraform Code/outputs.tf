//Create ECR Repository URI output
output "ecr_repository_uri" {
  description = "The URI of the ECR repository"
  value       = aws_ecr_repository.container_security_falcon.repository_url
}

