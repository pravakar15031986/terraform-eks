resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-${var.env}-cluster"
  role_arn = aws_iam_role.eks-cluster-iam-role.arn
  version  = var.k8s-ver

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.eks-vpc-pub-sub1.id,
      aws_subnet.eks-vpc-pub-sub2.id,
      aws_subnet.eks-vpc-priv-sub1.id,
      aws_subnet.eks-vpc-priv-sub2.id
    ]
  }
  # secrets_encryption_configuration {
  #   key_arn = aws_kms_key.eks_secrets_key.arn
  # }

  tags = {
    Name = "eks-${var.env}-cluster"
    Env = "${var.env}"
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-iam-policy
  ]
}

#resource "aws_eks_addon" "kube_proxy" {
#  cluster_name      = "eks-${var.env}-cluster"
#  addon_name        = "kube-proxy"
#  addon_version     = "v1.31.3-eksbuild.2"
#  resolve_conflicts_on_create = "OVERWRITE"
#  resolve_conflicts_on_update = "OVERWRITE"
#}

#resource "aws_eks_addon" "core_dns" {
#  cluster_name      = "eks-${var.env}-cluster"
#  addon_name        = "coredns"
#  addon_version     = "v1.11.4-eksbuild.2"
#  resolve_conflicts_on_create = "OVERWRITE"
#  resolve_conflicts_on_update = "OVERWRITE"
#}
#resource "aws_eks_addon" "aws_efs_csi_driver" {
#  cluster_name      = "eks-${var.env}-cluster"
#  addon_name        = "aws-efs-csi-driver"
#  addon_version     = "v2.1.3-eksbuild.1"
#  resolve_conflicts_on_create = "OVERWRITE"
#  resolve_conflicts_on_update = "OVERWRITE"
#}
