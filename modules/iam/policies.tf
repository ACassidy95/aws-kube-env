data "aws_iam_policy_document" "cluster_read_only" {
  statement {
    effect = "Allow"
    actions = [
      "eks:DescribeCluster",
      "eks:ListClusters"
    ]
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "cluster_admin" {
  statement {
    effect = "Allow"
    actions = [
      "eks:*"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "iam:PassRole"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["eks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "assume_cluster_admin" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    resources = [
      "${aws_iam_role.admin.arn}"
    ]
  }
}

data "aws_iam_policy_document" "assume_admin" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = toset(["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"])
    }
  }
}

resource "aws_iam_policy" "cluster_read_only" {
  name   = "AmazonEKSReadOnlyPolicy"
  policy = data.aws_iam_policy_document.cluster_read_only.json
}

resource "aws_iam_policy" "cluster_admin" {
  name   = "AmazonEKSClusterAdminPolicy"
  policy = data.aws_iam_policy_document.cluster_admin.json
}

resource "aws_iam_policy" "assume_cluster_admin" {
  name   = "AmazonEKSAssumeClusterAdminPolicy"
  policy = data.aws_iam_policy_document.assume_cluster_admin.json
}
