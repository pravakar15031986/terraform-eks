resource "aws_iam_role" "eks-nodes-generall-role" {
  name = "eks-${var.env}-nodes-generall-role"

  assume_role_policy = <<POLICY
  {
    "Version" : "2012-10-17",
    "Statement" : [
        {
            "Effect" : "Allow",
            "Principal" : {
                "Service" : "ec2.amazonaws.com"
            },
            "Action" : "sts:AssumeRole"
        }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "eks-worker-node-policy-generall" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-nodes-generall-role.name
}

resource "aws_iam_role_policy_attachment" "eks-cni-policy-generall" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-nodes-generall-role.name
}

resource "aws_iam_role_policy_attachment" "eks-ec2-container-registry-read-onlyy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-nodes-generall-role.name
}
