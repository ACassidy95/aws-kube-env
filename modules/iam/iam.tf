resource "aws_iam_role" "admin" {
  name               = "${var.base_name}-eks-admin"
  assume_role_policy = data.aws_iam_policy_document.assume_admin.json
}

resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.admin.name
  policy_arn = aws_iam_policy.cluster_admin.arn
}

resource "aws_iam_user" "viewer" {
  name = "${var.base_name}-eks-viewer"
}

resource "aws_iam_user_policy_attachment" "viewer" {
  user       = aws_iam_user.viewer.name
  policy_arn = aws_iam_policy.cluster_read_only.arn
}

resource "aws_iam_user" "manager" {
  name = "${var.base_name}-eks-manager"
}

resource "aws_iam_user_policy_attachment" "manager" {
  user       = aws_iam_user.manager.name
  policy_arn = aws_iam_policy.assume_cluster_admin.arn
}

resource "aws_eks_access_entry" "viewer" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_user.viewer.arn
  kubernetes_groups = var.viewer_kubernetes_groups
}

resource "aws_eks_access_entry" "manager" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_role.admin.arn
  kubernetes_groups = var.manager_kubernetes_groups
}
