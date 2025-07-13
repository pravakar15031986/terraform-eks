#resource "aws_iam_policy" "ecr_full_access" {
#  name        = "ECRFullAccessPolicy-${var.env}"
#  description = "Full access to ECR"
#  tags = {
#    Name = "eks-${var.env}-cluster"
#    Env = "${var.env}"
#  }
  
#  policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [
#      {
#        Effect = "Allow"
#        Action = [
#          "ecr:*"
#        ]
#        Resource = "*"
#      }
#    ]
# })
#}

#resource "aws_iam_user" "cli_user" {
#  name = "forge-ecr-pipeline-develop"
#  tags = {
#    Name = "eks-${var.env}-cluster"
#    Env = "${var.env}"
#  }
#}

#resource "aws_iam_user_policy_attachment" "attach_user_ecr_policy" {
#  user       = aws_iam_user.cli_user.name
#  policy_arn = aws_iam_policy.ecr_full_access.arn
#}

#resource "aws_iam_access_key" "cli_user_access_key" {
#  user = aws_iam_user.cli_user.name
#}
