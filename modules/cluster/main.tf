resource "aws_eks_cluster" "this" {
  name    = "${var.base_name}-cluster"
  version = var.cluster_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  role_arn = aws_iam_role.this.arn

  // Create role attachment before cluster and destroy it after, otherwise
  // EKS controller may lose ability to interact with EKS-managed EC2 infra
  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

resource "aws_iam_role" "this" {
  name = "${var.base_name}-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.this
}