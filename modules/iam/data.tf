data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "viewer" {
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

data "aws_iam_policy_document" "assume_admin" {
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

data "aws_iam_policy_document" "admin" {
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

data "aws_iam_policy_document" "admin_role_policy" {
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