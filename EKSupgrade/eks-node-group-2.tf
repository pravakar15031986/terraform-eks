resource "aws_eks_node_group" "eks-nodes-generall-role" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "eks-${var.env}-nodess"
  node_role_arn   = aws_iam_role.eks-nodes-generall-role.arn
  version         = "1.31" 

  subnet_ids = [
    aws_subnet.eks-vpc-pub-sub1.id,
    aws_subnet.eks-vpc-pub-sub2.id
  ]

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 1
  }

#  ami_type             = "t3.small"
  capacity_type        = "ON_DEMAND"
  force_update_version = false
  ami_type        = "AL2_x86_64"  # Using Amazon Linux 2 EKS Optimized AMI
#  instance_types  = ["t3.medium"]

  tags = {
    Name = "eks-${var.env}-nodee"
    Env  = "${var.env}"
  }

  labels = {
    role = "eks-nodess"
  }

  launch_template {
    id      = aws_launch_template.eks_template.id
    version = "$Latest"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-worker-node-policy-generall,
 #   aws_iam_role_policy_attachment.eks-cni-policy-generall,
#    aws_iam_role_policy_attachment.eks-ec2-container-registry-read-onlyy
  ]
}

resource "aws_launch_template" "eks_template" {
  name_prefix   = "eks-${var.env}-template"
#   image_id      = "ami-09a9858973b288bdd"
   instance_type = "t3.large"

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 50
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
    }
  }
}
