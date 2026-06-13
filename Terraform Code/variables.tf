//Declare variables for aws region
variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

//Create ECR repository variable named "container-security-falcon"
variable "ecr_repository_name" {
  description = "The name of the ECR repository to create"
  type        = string
  default     = "container-security-falcon"
}

//Create Image Tag mutitblity declaration for ECR repository
variable "ecr_image_tag_mutability" {
  description = "The tag mutability for the ECR repository"
  type        = string
  default     = "IMMUTABLE"
}


//Create CloudWatch log group name variable named "/ecs/container-security-falcon"
variable "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch log group to create"
  type        = string
  default     = "/ecs/container-security-falcon"
}

//Create ECS Task family variable named "container-security-falcon-task"
variable "ecs_task_family" {
  description = "The family name for the ECS task definition"
  type        = string
  default     = "container-security-falcon-task"
}