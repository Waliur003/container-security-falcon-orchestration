//Create AWS CloudWatch log group
resource "aws_cloudwatch_log_group" "container_security_falcon" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = 14

//tagging for CloudWatch log group
  tags = {
    Name        = var.cloudwatch_log_group_name
    Environment = "Production"
    Project     = "Container Security Falcon"
  }

}