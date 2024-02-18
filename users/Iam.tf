# Defining an IAM policy document for eks users ("developers") with limited EKS access
data "aws_iam_policy_document" "developer" {
  statement {
    sid    = "AllowDeveloper"
    effect = "Allow"
    actions = [
      "eks:DescribeNodegroup",
      "eks:ListNodegroups",
      "eks:DescribeCluster",
      "eks:ListClusters",
      "eks:AccessKubernetesApi",
      "ssm:GetParameter",
      "eks:ListUpdates",
      "eks:ListFargateProfiles"
    ]
    resources = ["*"]
  }
}

# Defining an IAM policy document for eks administrators ("managers") with full EKS access
data "aws_iam_policy_document" "admin" {
  statement {
    sid       = "AllowAdmin"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
  statement {
    sid    = "AllowPassRole"
    effect = "Allow"
    actions = [
      "iam:PassRole"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["eks.amazonaws.com"]
    }
  }
}

# Defining an IAM policy document for eks managers ("managers") to assume the "Manager-eks-Role"
data "aws_iam_policy_document" "manager_assume_role" {
  statement {
    sid    = "AllowManagerAssumeRole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    # Restricting principals to specific users in the current account
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/manager"]
      #identifiers = ["data.aws_caller_identity.current.account_id]
    }
  }
}

# Retrieving information about the current user making the request
data "aws_caller_identity" "current" {}

