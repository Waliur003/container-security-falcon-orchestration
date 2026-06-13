//Create ECS Task definition for container security application
resource "aws_ecs_task_definition" "container_security_falcon" {
    family                   = var.ecs_task_family
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = aws_iam_role.AmazonECSTaskExecutionRole.arn
    container_definitions    = jsonencode([
        {
            name      = var.ecs_task_family
            image     = "${aws_ecr_repository.container_security_falcon.repository_url}:latest"
            essential = true
            portMappings = [
                {
                    containerPort = 80
                    hostPort      = 80
                    protocol      = "tcp"
                }
            ]
            logConfiguration = {
                logDriver = "awslogs"
                options = {
                    "awslogs-group"         = var.cloudwatch_log_group_name
                    "awslogs-region"        = var.aws_region
                    "awslogs-stream-prefix" = var.ecs_task_family
                }
            }
        }

    ])

    tags = {
        Name        = var.ecs_task_family
        Environment = "Production"
        Project     = "Container Security Falcon"
    }
}