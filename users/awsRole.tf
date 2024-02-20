# IAM Role with AWS Services and Terraform Operations Capabilities
resource "aws_iam_role" "aws_admin_role" {
  name = "AWSAdminRole"

  # Allowing EC2 instances to assume this role for provisioning
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com",
        },
      },
    ],
  })
}

# IAM Role Policy for Viewing AWS Resources
resource "aws_iam_role_policy" "view_resources" {
  name = "ViewAllResources"
  role = aws_iam_role.aws_admin_role.id

  # Limiting actions to read-only operations (describe, list)
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "s3:List*",
          "rds:Describe*",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

# IAM Role Policy for Terraform Plan/Apply Operations
resource "aws_iam_role_policy" "terraform_operations" {
  name = "TerraformOperations"
  role = aws_iam_role.aws_admin_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:PassRole",
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/your-project-role-arn"
      ]
    },
    {
      "Action": [
        "states:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:states:::region:account-id:execution:*"
      ]
    }
  ]
}
EOF
}

# IAM Role Policy for Access Logs
resource "aws_iam_role_policy" "access_logs" {
  name = "AccessLogs"
  role = aws_iam_role.aws_admin_role.id

  # Allowing access to cloudtrail and logs services for monitoring
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "cloudtrail:LookupEvents",
          "logs:*",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

# IAM Group for AWSAdmin Users
resource "aws_iam_group" "aws_admin_group" {
  name = "AWSAdminGroup"
}


# IAM User to join AWSAdminGroup 
resource "aws_iam_user" "aws_admin_user" {
  name = "aws-admin-user"
}

# Adding AWSAdminUser to AWSAdminGroup
resource "aws_iam_group_membership" "aws_admin_user_membership" {
  name = "aws-admin-user-membership"

  users = [
    aws_iam_user.aws_admin_user.name,
  ]

  group = aws_iam_group.aws_admin_group.name
}

# IAM Policy for Group Members to Assume AWS Admin Role
resource "aws_iam_policy" "assume_role_policy" {
  name        = "assume-aws-admin-role-policy"
  description = "Policy that allows group members to assume the AWS Admin role"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = aws_iam_role.aws_admin_role.arn,
      },
    ],
  })
}

# Attaching AssumeRolePolicy to AWSAdminGroup
resource "aws_iam_group_policy_attachment" "assume_role_policy_attachment" {
  group      = aws_iam_group.aws_admin_group.name
  policy_arn = aws_iam_policy.assume_role_policy.arn
}
