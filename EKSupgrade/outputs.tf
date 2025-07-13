output "aws_region" {
  description = "AWS develop Region"
  value       = var.region
}

output "aws_vpc" {
  description = "EKS develop VPC ID"
  value       = aws_vpc.eks-vpc.id
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value = aws_eks_cluster.eks-cluster.name
}

#output "access_key_id" {
#  value     = aws_iam_access_key.cli_user_access_key.id
#  sensitive = true
#}

#output "secret_access_key" {
#  value     = aws_iam_access_key.cli_user_access_key.secret
#  sensitive = true
#}
