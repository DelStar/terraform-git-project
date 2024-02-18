[0m[1mdata.aws_iam_policy_document.athena_workgroup_policy: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.athena_workgroup_policy: Read complete after 0s [id=1884401895][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m

Terraform will perform the following actions:

[1m  # aws_iam_group.athena_workgroup_for_athena_queries[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_group" "athena_workgroup_for_athena_queries" {
      [32m+[0m[0m arn       = (known after apply)
      [32m+[0m[0m id        = (known after apply)
      [32m+[0m[0m name      = "athena-workgroup-for-athena-queries"
      [32m+[0m[0m path      = "/"
      [32m+[0m[0m unique_id = (known after apply)
    }

[1m  # aws_iam_group_membership.athena_group_membership[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_group_membership" "athena_group_membership" {
      [32m+[0m[0m group = "athena-workgroup-for-athena-queries"
      [32m+[0m[0m id    = (known after apply)
      [32m+[0m[0m name  = "athena_group_membership"
      [32m+[0m[0m users = [
          [32m+[0m[0m "athena-user",
        ]
    }

[1m  # aws_iam_policy.athena_workgroup_access_policy[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_policy" "athena_workgroup_access_policy" {
      [32m+[0m[0m arn         = (known after apply)
      [32m+[0m[0m id          = (known after apply)
      [32m+[0m[0m name        = "AthenaWorkgroupAccessPolicy"
      [32m+[0m[0m name_prefix = (known after apply)
      [32m+[0m[0m path        = "/"
      [32m+[0m[0m policy      = jsonencode(
            {
              [32m+[0m[0m Statement = [
                  [32m+[0m[0m {
                      [32m+[0m[0m Action   = [
                          [32m+[0m[0m "athena:StopQueryExecution",
                          [32m+[0m[0m "athena:StartQueryExecution",
                          [32m+[0m[0m "athena:ListTables",
                          [32m+[0m[0m "athena:GetWorkGroup",
                          [32m+[0m[0m "athena:GetQueryResults",
                          [32m+[0m[0m "athena:GetQueryExecution",
                          [32m+[0m[0m "athena:GetDatabase",
                        ]
                      [32m+[0m[0m Effect   = "Allow"
                      [32m+[0m[0m Resource = "arn:aws:athena:us-east-1:730335426441:workgroup/athena-workgroup-for-athena-queries"
                      [32m+[0m[0m Sid      = ""
                    },
                ]
              [32m+[0m[0m Version   = "2012-10-17"
            }
        )
      [32m+[0m[0m policy_id   = (known after apply)
      [32m+[0m[0m tags_all    = (known after apply)
    }

[1m  # aws_iam_policy.s3_query_policy_for_lottery_data_bucket[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_policy" "s3_query_policy_for_lottery_data_bucket" {
      [32m+[0m[0m arn         = (known after apply)
      [32m+[0m[0m id          = (known after apply)
      [32m+[0m[0m name        = "s3-query-policy-for-lottery-data-bucket"
      [32m+[0m[0m name_prefix = (known after apply)
      [32m+[0m[0m path        = "/"
      [32m+[0m[0m policy      = jsonencode(
            {
              [32m+[0m[0m Statement = [
                  [32m+[0m[0m {
                      [32m+[0m[0m Action    = [
                          [32m+[0m[0m "s3:GetObject",
                          [32m+[0m[0m "s3:ListBucket",
                        ]
                      [32m+[0m[0m Condition = {
                          [32m+[0m[0m StringLike = {
                              [32m+[0m[0m "s3:source-bucket" = [
                                  [32m+[0m[0m "arn:aws:s3:::lottery-data-bucket",
                                ]
                            }
                        }
                      [32m+[0m[0m Effect    = "Allow"
                      [32m+[0m[0m Resource  = [
                          [32m+[0m[0m "arn:aws:s3:::lottery-data-bucket",
                          [32m+[0m[0m "arn:aws:s3:::lottery-data-bucket/*",
                        ]
                    },
                ]
              [32m+[0m[0m Version   = "2012-10-17"
            }
        )
      [32m+[0m[0m policy_id   = (known after apply)
      [32m+[0m[0m tags_all    = (known after apply)
    }

[1m  # aws_iam_role.athena_query_role[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role" "athena_query_role" {
      [32m+[0m[0m arn                   = (known after apply)
      [32m+[0m[0m assume_role_policy    = jsonencode(
            {
              [32m+[0m[0m Statement = [
                  [32m+[0m[0m {
                      [32m+[0m[0m Action    = "sts:AssumeRole"
                      [32m+[0m[0m Effect    = "Allow"
                      [32m+[0m[0m Principal = {
                          [32m+[0m[0m Service = [
                              [32m+[0m[0m "athena.amazonaws.com",
                            ]
                        }
                    },
                ]
              [32m+[0m[0m Version   = "2012-10-17"
            }
        )
      [32m+[0m[0m create_date           = (known after apply)
      [32m+[0m[0m force_detach_policies = false
      [32m+[0m[0m id                    = (known after apply)
      [32m+[0m[0m managed_policy_arns   = (known after apply)
      [32m+[0m[0m max_session_duration  = 3600
      [32m+[0m[0m name                  = "athena-query-role"
      [32m+[0m[0m name_prefix           = (known after apply)
      [32m+[0m[0m path                  = "/"
      [32m+[0m[0m role_last_used        = (known after apply)
      [32m+[0m[0m tags                  = {
          [32m+[0m[0m "Name" = "AthenaQueryRole"
        }
      [32m+[0m[0m tags_all              = {
          [32m+[0m[0m "Name" = "AthenaQueryRole"
        }
      [32m+[0m[0m unique_id             = (known after apply)
    }

[1m  # aws_iam_role_policy_attachment.athena_workgroup_policy_attachment[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "athena_workgroup_policy_attachment" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = (known after apply)
      [32m+[0m[0m role       = "athena-query-role"
    }

[1m  # aws_iam_role_policy_attachment.s3_query_attachment_for_lottery_data_bucket[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "s3_query_attachment_for_lottery_data_bucket" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = (known after apply)
      [32m+[0m[0m role       = "athena-query-role"
    }

[1m  # aws_iam_user.athena_query_user[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_user" "athena_query_user" {
      [32m+[0m[0m arn           = (known after apply)
      [32m+[0m[0m force_destroy = false
      [32m+[0m[0m id            = (known after apply)
      [32m+[0m[0m name          = "athena-user"
      [32m+[0m[0m path          = "/"
      [32m+[0m[0m tags_all      = (known after apply)
      [32m+[0m[0m unique_id     = (known after apply)
    }

[1m  # aws_kms_key.lottery_data_bucket_key[0m will be created
[0m  [32m+[0m[0m resource "aws_kms_key" "lottery_data_bucket_key" {
      [32m+[0m[0m arn                                = (known after apply)
      [32m+[0m[0m bypass_policy_lockout_safety_check = false
      [32m+[0m[0m customer_master_key_spec           = "SYMMETRIC_DEFAULT"
      [32m+[0m[0m description                        = "KMS key for encrypting the lottery data bucket"
      [32m+[0m[0m enable_key_rotation                = false
      [32m+[0m[0m id                                 = (known after apply)
      [32m+[0m[0m is_enabled                         = true
      [32m+[0m[0m key_id                             = (known after apply)
      [32m+[0m[0m key_usage                          = "ENCRYPT_DECRYPT"
      [32m+[0m[0m multi_region                       = (known after apply)
      [32m+[0m[0m policy                             = (known after apply)
      [32m+[0m[0m tags_all                           = (known after apply)
    }

[1m  # aws_s3_bucket.lottery_data_bucket[0m will be created
[0m  [32m+[0m[0m resource "aws_s3_bucket" "lottery_data_bucket" {
      [32m+[0m[0m acceleration_status         = (known after apply)
      [32m+[0m[0m acl                         = (known after apply)
      [32m+[0m[0m arn                         = (known after apply)
      [32m+[0m[0m bucket                      = "lottery-data-bucket"
      [32m+[0m[0m bucket_domain_name          = (known after apply)
      [32m+[0m[0m bucket_prefix               = (known after apply)
      [32m+[0m[0m bucket_regional_domain_name = (known after apply)
      [32m+[0m[0m force_destroy               = false
      [32m+[0m[0m hosted_zone_id              = (known after apply)
      [32m+[0m[0m id                          = (known after apply)
      [32m+[0m[0m object_lock_enabled         = (known after apply)
      [32m+[0m[0m policy                      = (known after apply)
      [32m+[0m[0m region                      = (known after apply)
      [32m+[0m[0m request_payer               = (known after apply)
      [32m+[0m[0m tags                        = {
          [32m+[0m[0m "Name" = "lottery-data-bucket"
        }
      [32m+[0m[0m tags_all                    = {
          [32m+[0m[0m "Name" = "lottery-data-bucket"
        }
      [32m+[0m[0m website_domain              = (known after apply)
      [32m+[0m[0m website_endpoint            = (known after apply)
    }

[1m  # aws_s3_bucket_object.lottery_data_file[0m will be created
[0m  [32m+[0m[0m resource "aws_s3_bucket_object" "lottery_data_file" {
      [32m+[0m[0m acl                    = "private"
      [32m+[0m[0m bucket                 = "lottery-data-bucket"
      [32m+[0m[0m bucket_key_enabled     = (known after apply)
      [32m+[0m[0m content_type           = (known after apply)
      [32m+[0m[0m etag                   = (known after apply)
      [32m+[0m[0m force_destroy          = false
      [32m+[0m[0m id                     = (known after apply)
      [32m+[0m[0m key                    = "lottery-data-file.csv"
      [32m+[0m[0m kms_key_id             = (known after apply)
      [32m+[0m[0m server_side_encryption = (known after apply)
      [32m+[0m[0m source                 = "/home/user/terraform-git-project/lotto.csv"
      [32m+[0m[0m storage_class          = (known after apply)
      [32m+[0m[0m tags_all               = (known after apply)
      [32m+[0m[0m version_id             = (known after apply)
    }

[1m  # aws_s3_bucket_server_side_encryption_configuration.lottery_data_bucket_sse[0m will be created
[0m  [32m+[0m[0m resource "aws_s3_bucket_server_side_encryption_configuration" "lottery_data_bucket_sse" {
      [32m+[0m[0m bucket = (known after apply)
      [32m+[0m[0m id     = (known after apply)

      [32m+[0m[0m rule {
          [32m+[0m[0m apply_server_side_encryption_by_default {
              [32m+[0m[0m kms_master_key_id = (known after apply)
              [32m+[0m[0m sse_algorithm     = "aws:kms"
            }
        }
    }

[1m  # aws_s3_bucket_versioning.versioning_lottery_data_bucket[0m will be created
[0m  [32m+[0m[0m resource "aws_s3_bucket_versioning" "versioning_lottery_data_bucket" {
      [32m+[0m[0m bucket = (known after apply)
      [32m+[0m[0m id     = (known after apply)

      [32m+[0m[0m versioning_configuration {
          [32m+[0m[0m mfa_delete = (known after apply)
          [32m+[0m[0m status     = "Enabled"
        }
    }

[1mPlan:[0m 13 to add, 0 to change, 0 to destroy.
[0m[33m╷[0m[0m
[33m│[0m [0m[1m[33mWarning: [0m[0m[1mArgument is deprecated[0m
[33m│[0m [0m
[33m│[0m [0m[0m  with aws_s3_bucket_object.lottery_data_file,
[33m│[0m [0m  on main.tf line 38, in resource "aws_s3_bucket_object" "lottery_data_file":
[33m│[0m [0m  38:   bucket = [4maws_s3_bucket.lottery_data_bucket.bucket[0m[0m
[33m│[0m [0m
[33m│[0m [0mUse the aws_s3_object resource instead
[33m│[0m [0m
[33m│[0m [0m(and 2 more similar warnings elsewhere)
[33m╵[0m[0m
[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
