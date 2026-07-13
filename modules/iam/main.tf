resource "aws_iam_user" "this" {
  name = var.base_name
}

resource "aws_iam_policy" "this" {
  name = "AmazonEKSDeveloperPolicy"

  policy = <<POLICY
{
    "Version": "2012-10-07",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:DescribeCluster",
                "eks:ListerClusters"
            ],
            "Resource": "*"
        }
    ]
}
    POLICY
}

resource "aws_iam_policy_attachment" "this" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_eks_access_entry" "this" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_user.this.arn
  kubernetes_groups = var.kubernetes_groups
}