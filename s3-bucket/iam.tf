# Creating an Athena Workgroup for Secure Queries
resource "aws_iam_group" "athena_workgroup_for_athena_queries" {
  name = "athena-workgroup-for-athena-queries"
}

# Defining a Role for Athena Queries with Least Privilege
resource "aws_iam_role" "athena_query_role" {
  name               = "athena-query-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": ["athena.amazonaws.com"] 
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Name = "AthenaQueryRole"
  }
}

data "aws_iam_policy_document" "athena_workgroup_policy" {
  statement {
    actions = [
      "athena:GetWorkGroup",
      "athena:StartQueryExecution",
      "athena:StopQueryExecution",
      "athena:GetQueryExecution",
      "athena:GetQueryResults",
      "athena:GetDatabase",
      "athena:ListTables",
    ]

    resources = [
      "arn:aws:athena:us-east-1:730335426441:workgroup/athena-workgroup-for-athena-queries"
    ]
  }
}

resource "aws_iam_policy" "athena_workgroup_access_policy" {
  name   = "AthenaWorkgroupAccessPolicy"
  policy = data.aws_iam_policy_document.athena_workgroup_policy.json
}


# Attaching Workgroup Policy to Grant Workgroup Permissions
resource "aws_iam_role_policy_attachment" "athena_workgroup_policy_attachment" {
  role       = aws_iam_role.athena_query_role.name
  policy_arn = aws_iam_policy.athena_workgroup_access_policy.arn
}

# Creating Policy for Limited S3 Access for Athena Queries
resource "aws_iam_policy" "s3_query_policy_for_lottery_data_bucket" {
  name = "s3-query-policy-for-lottery-data-bucket"

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

# Attaching S3 Query Policy to Role for Authorized Access
resource "aws_iam_role_policy_attachment" "s3_query_attachment_for_lottery_data_bucket" {
  role       = aws_iam_role.athena_query_role.name
  policy_arn = aws_iam_policy.s3_query_policy_for_lottery_data_bucket.arn
}

# Creating IAM User that can assume the Athena Query Role

resource "aws_iam_user" "athena_query_user" {
  name = "athena-user"
}

# Adding the athena query user to the athena Workgroup
resource "aws_iam_group_membership" "athena_group_membership" {
  name  = "athena_group_membership"
  users = [aws_iam_user.athena_query_user.name]
  group = aws_iam_group.athena_workgroup_for_athena_queries.name
}


