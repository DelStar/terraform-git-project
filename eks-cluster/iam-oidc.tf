# Retrieving the OpenID Connect (OIDC) issuer URL from the EKS cluster's identity configuration
data "tls_certificate" "eks" {
  url = aws_eks_cluster.demo_cluster.identity[0].oidc[0].issuer
}

# Defining an IAM OpenID Connect provider to trust the EKS cluster's OIDC endpoint
resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.demo_cluster.identity[0].oidc[0].issuer

  depends_on = [aws_eks_cluster.demo_cluster]
}
#####################################################################################
# IAM Policy for OIDC provider
# This policy document allows entities assuming the role to perform actions if they match the specified condition.
data "aws_iam_policy_document" "test_oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:default:aws-test"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "test_oidc" {
  assume_role_policy = data.aws_iam_policy_document.test_oidc_assume_role_policy.json
  name               = "test-oidc"
}
# Creating a policy for accessing S3 with specific permissions
resource "aws_iam_policy" "test_policy" {
  name = "test-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::lottery-data-bucket",
        "arn:aws:s3:::lottery-data-bucket/*"
      ],
      "Condition": {
        "StringLike": {
          "s3:source-bucket": [
            "arn:aws:s3:::lottery-data-bucket"
          ]
        }
      }
    }
  ]
}
EOF
}

# Attaching the policy to the test OIDC IAM Role
resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.test_oidc.name
  policy_arn = aws_iam_policy.test_policy.arn
}

# Outputing the ARN of the test OIDC role for reference
output "test_policy_arn" {
  value = aws_iam_role.test_oidc.arn
}