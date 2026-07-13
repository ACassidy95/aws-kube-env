resource "aws_iam_role" "admin" {
  name               = "${var.base_name}-eks-admin"
  assume_role_policy = data.aws_iam_policy_document.admin_role_policy.json
}

resource "aws_iam_user" "viewer" {
  name = "${var.base_name}-eks-viewer"
}

resource "aws_iam_policy" "admin" {
  name   = "AmazonEKSAdminPolicy"
  policy = data.aws_iam_policy_document.admin.json
}

resource "aws_iam_policy" "viewer" {
  name   = "AmazonEKSViewerPolicy"
  policy = data.aws_iam_policy_document.viewer.json
}

resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.admin.name
  policy_arn = aws_iam_policy.viewer.arn
}

resource "aws_iam_policy_attachment" "viewer" {
  name       = "${var.base_name}-viewer-policy-attachment"
  users      = toset([aws_iam_user.viewer.name])
  policy_arn = aws_iam_policy.viewer.arn
}

resource "aws_eks_access_entry" "viewer" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_user.viewer.arn
  kubernetes_groups = var.kubernetes_groups
}