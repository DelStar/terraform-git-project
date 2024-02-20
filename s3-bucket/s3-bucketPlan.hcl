[0m[1maws_iam_group.athena_workgroup_for_athena_queries: Refreshing state... [id=athena-workgroup-for-athena-queries][0m
[0m[1mdata.aws_iam_policy_document.athena_workgroup_policy: Reading...[0m[0m
[0m[1maws_kms_key.lottery_data_bucket_key: Refreshing state... [id=6859d598-204f-4733-8985-29b5d3edd2e5][0m
[0m[1maws_iam_policy.s3_query_policy_for_lottery_data_bucket: Refreshing state... [id=arn:aws:iam::730335426441:policy/s3-query-policy-for-lottery-data-bucket][0m
[0m[1maws_iam_user.athena_query_user: Refreshing state... [id=athena-user][0m
[0m[1maws_s3_bucket_object.lottery_data_file: Refreshing state... [id=lottery-data-file.csv][0m
[0m[1maws_iam_role.athena_query_role: Refreshing state... [id=athena-query-role][0m
[0m[1maws_s3_bucket.lottery_data_bucket: Refreshing state... [id=lottery-data-bucket][0m
[0m[1mdata.aws_iam_policy_document.athena_workgroup_policy: Read complete after 0s [id=1884401895][0m
[0m[1maws_s3_bucket.athena_results_bucket: Refreshing state... [id=athena-results-bckt][0m
[0m[1maws_iam_policy.athena_workgroup_access_policy: Refreshing state... [id=arn:aws:iam::730335426441:policy/AthenaWorkgroupAccessPolicy][0m
[0m[1maws_iam_group_membership.athena_group_membership: Refreshing state... [id=athena_group_membership][0m
[0m[1maws_iam_role_policy_attachment.athena_workgroup_policy_attachment: Refreshing state... [id=athena-query-role-20240218010347645100000001][0m
[0m[1maws_iam_role_policy_attachment.s3_query_attachment_for_lottery_data_bucket: Refreshing state... [id=athena-query-role-20240218010347674900000002][0m
[0m[1maws_s3_bucket_versioning.versioning_lottery_data_bucket: Refreshing state... [id=lottery-data-bucket][0m
[0m[1maws_s3_bucket_server_side_encryption_configuration.lottery_data_bucket_sse: Refreshing state... [id=lottery-data-bucket][0m
[0m[1maws_s3_bucket_versioning.versioning_athena_results_bucket: Refreshing state... [id=athena-results-bckt][0m
[0m[1maws_s3_bucket_server_side_encryption_configuration.athena_results_bucket_sse: Refreshing state... [id=athena-results-bckt][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m

Terraform will perform the following actions:

[1m  # aws_s3_bucket_object.lottery_mega_data_file[0m will be created
[0m  [32m+[0m[0m resource "aws_s3_bucket_object" "lottery_mega_data_file" {
      [32m+[0m[0m acl                    = "private"
      [32m+[0m[0m bucket                 = "lottery-data-bucket"
      [32m+[0m[0m bucket_key_enabled     = (known after apply)
      [32m+[0m[0m content_type           = (known after apply)
      [32m+[0m[0m etag                   = (known after apply)
      [32m+[0m[0m force_destroy          = false
      [32m+[0m[0m id                     = (known after apply)
      [32m+[0m[0m key                    = "lottery-mega-data-file.csv"
      [32m+[0m[0m kms_key_id             = (known after apply)
      [32m+[0m[0m server_side_encryption = (known after apply)
      [32m+[0m[0m source                 = "/home/user/terraform-git-project/lotto.csv"
      [32m+[0m[0m storage_class          = (known after apply)
      [32m+[0m[0m tags_all               = (known after apply)
      [32m+[0m[0m version_id             = (known after apply)
    }

[1mPlan:[0m 1 to add, 0 to change, 0 to destroy.
[0m[33m╷[0m[0m
[33m│[0m [0m[1m[33mWarning: [0m[0m[1mArgument is deprecated[0m
[33m│[0m [0m
[33m│[0m [0m[0m  with aws_s3_bucket_object.lottery_mega_data_file,
[33m│[0m [0m  on main.tf line 38, in resource "aws_s3_bucket_object" "lottery_mega_data_file":
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
