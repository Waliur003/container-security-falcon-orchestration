//Create IAM Policy Document listing read actions for S3 global checking arrays, EC2 security parameters, and write items for your database systems.
data "aws_iam_policy_document" "AmazonECSTaskExecutionRolePolicy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "ec2:DescribeInstances",
      "ec2:DescribeSecurityGroups",
      "rds:DescribeDBInstances",
      "dynamodb:Scan",
      "dynamodb:Query"
    ]
    resources = ["*"]
  }
}

//Attach the IAM policy document to an IAM role for ECS task execution named "AmazonECSTaskExecutionRole"
resource "aws_iam_role" "AmazonECSTaskExecutionRole" {
  name = "AmazonECSTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

//Attach the IAM policy document to the IAM role
resource "aws_iam_role_policy" "AmazonECSTaskExecutionRolePolicy" {
  name   = "AmazonECSTaskExecutionRolePolicy"
  role   = aws_iam_role.AmazonECSTaskExecutionRole.name
  policy = data.aws_iam_policy_document.AmazonECSTaskExecutionRolePolicy.json
}


//Attach the AWS managed policy "AmazonECSTaskExecutionRolePolicy" to the IAM role for ECS task execution
resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicy_Managed" {
  role       = aws_iam_role.AmazonECSTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

