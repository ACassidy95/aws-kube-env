data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "viewer" {
  statement {
    actions = [
      "eks:DescribeCluster",
      "eks:ListerClusters",
    ]
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "manager" {
  statement {
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
    resources = [
      "*"
    ]
    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "iam:PassedToService"
      values   = ["eks.amazon.com"]
    }
  }
}

data "aws_iam_policy_document" "admin_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = toset(["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"])
    }
  }
}