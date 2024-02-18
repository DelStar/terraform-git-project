[0m[1mdata.terraform_remote_state.network: Reading...[0m[0m
[0m[1mdata.terraform_remote_state.network: Read complete after 0s[0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m
 [36m<=[0m read (data resources)[0m

Terraform will perform the following actions:

[1m  # data.aws_iam_policy_document.eks_cluster_autoscaler_assume_role_policy[0m will be read during apply
  # (config refers to values not yet known)
[0m [36m<=[0m[0m data "aws_iam_policy_document" "eks_cluster_autoscaler_assume_role_policy" {
      [32m+[0m[0m id   = (known after apply)
      [32m+[0m[0m json = (known after apply)

      [32m+[0m[0m statement {
          [32m+[0m[0m actions = [
              [32m+[0m[0m "sts:AssumeRoleWithWebIdentity",
            ]
          [32m+[0m[0m effect  = "Allow"

          [32m+[0m[0m condition {
              [32m+[0m[0m test     = "StringEquals"
              [32m+[0m[0m values   = [
                  [32m+[0m[0m "system:serviceaccount:kube-system:cluster-autoscaler",
                ]
              [32m+[0m[0m variable = (known after apply)
            }

          [32m+[0m[0m principals {
              [32m+[0m[0m identifiers = [
                  [32m+[0m[0m (known after apply),
                ]
              [32m+[0m[0m type        = "Federated"
            }
        }
    }

[1m  # data.aws_iam_policy_document.test_oidc_assume_role_policy[0m will be read during apply
  # (config refers to values not yet known)
[0m [36m<=[0m[0m data "aws_iam_policy_document" "test_oidc_assume_role_policy" {
      [32m+[0m[0m id   = (known after apply)
      [32m+[0m[0m json = (known after apply)

      [32m+[0m[0m statement {
          [32m+[0m[0m actions = [
              [32m+[0m[0m "sts:AssumeRoleWithWebIdentity",
            ]
          [32m+[0m[0m effect  = "Allow"

          [32m+[0m[0m condition {
              [32m+[0m[0m test     = "StringEquals"
              [32m+[0m[0m values   = [
                  [32m+[0m[0m "system:serviceaccount:default:aws-test",
                ]
              [32m+[0m[0m variable = (known after apply)
            }

          [32m+[0m[0m principals {
              [32m+[0m[0m identifiers = [
                  [32m+[0m[0m (known after apply),
                ]
              [32m+[0m[0m type        = "Federated"
            }
        }
    }

[1m  # data.tls_certificate.eks[0m will be read during apply
  # (config refers to values not yet known)
[0m [36m<=[0m[0m data "tls_certificate" "eks" {
      [32m+[0m[0m certificates = (known after apply)
      [32m+[0m[0m id           = (known after apply)
      [32m+[0m[0m url          = (known after apply)
    }

[1m  # aws_eks_cluster.demo_cluster[0m will be created
[0m  [32m+[0m[0m resource "aws_eks_cluster" "demo_cluster" {
      [32m+[0m[0m arn                   = (known after apply)
      [32m+[0m[0m certificate_authority = (known after apply)
      [32m+[0m[0m cluster_id            = (known after apply)
      [32m+[0m[0m created_at            = (known after apply)
      [32m+[0m[0m endpoint              = (known after apply)
      [32m+[0m[0m id                    = (known after apply)
      [32m+[0m[0m identity              = (known after apply)
      [32m+[0m[0m name                  = "demo-cluster"
      [32m+[0m[0m platform_version      = (known after apply)
      [32m+[0m[0m role_arn              = "arn:aws:iam::730335426441:role/eks-cluster-demo-cluster"
      [32m+[0m[0m status                = (known after apply)
      [32m+[0m[0m tags_all              = (known after apply)
      [32m+[0m[0m version               = (known after apply)

      [32m+[0m[0m vpc_config {
          [32m+[0m[0m cluster_security_group_id = (known after apply)
          [32m+[0m[0m endpoint_private_access   = false
          [32m+[0m[0m endpoint_public_access    = true
          [32m+[0m[0m public_access_cidrs       = (known after apply)
          [32m+[0m[0m subnet_ids                = [
              [32m+[0m[0m "subnet-0159d4e5ca92b6ea9",
              [32m+[0m[0m "subnet-0788e5b0230ad88ae",
              [32m+[0m[0m "subnet-0aec9ef6bbbfe752e",
              [32m+[0m[0m "subnet-0f0e4632b38a4494a",
            ]
          [32m+[0m[0m vpc_id                    = (known after apply)
        }
    }

[1m  # aws_eks_node_group.private-nodes[0m will be created
[0m  [32m+[0m[0m resource "aws_eks_node_group" "private-nodes" {
      [32m+[0m[0m ami_type               = (known after apply)
      [32m+[0m[0m arn                    = (known after apply)
      [32m+[0m[0m capacity_type          = "SPOT"
      [32m+[0m[0m cluster_name           = "demo-cluster"
      [32m+[0m[0m disk_size              = (known after apply)
      [32m+[0m[0m id                     = (known after apply)
      [32m+[0m[0m instance_types         = [
          [32m+[0m[0m "t3.large",
        ]
      [32m+[0m[0m labels                 = {
          [32m+[0m[0m "role" = "general"
        }
      [32m+[0m[0m node_group_name        = "private-nodes"
      [32m+[0m[0m node_group_name_prefix = (known after apply)
      [32m+[0m[0m node_role_arn          = "arn:aws:iam::730335426441:role/eks-node-group-nodes"
      [32m+[0m[0m release_version        = (known after apply)
      [32m+[0m[0m resources              = (known after apply)
      [32m+[0m[0m status                 = (known after apply)
      [32m+[0m[0m subnet_ids             = [
          [32m+[0m[0m "subnet-0159d4e5ca92b6ea9",
          [32m+[0m[0m "subnet-0788e5b0230ad88ae",
        ]
      [32m+[0m[0m tags                   = {
          [32m+[0m[0m "k8s.io/cluster-autoscaler/demo_cluster" = "owned"
          [32m+[0m[0m "k8s.io/cluster-autoscaler/enabled"      = "true"
        }
      [32m+[0m[0m tags_all               = {
          [32m+[0m[0m "k8s.io/cluster-autoscaler/demo_cluster" = "owned"
          [32m+[0m[0m "k8s.io/cluster-autoscaler/enabled"      = "true"
        }
      [32m+[0m[0m version                = (known after apply)

      [32m+[0m[0m scaling_config {
          [32m+[0m[0m desired_size = 1
          [32m+[0m[0m max_size     = 10
          [32m+[0m[0m min_size     = 0
        }

      [32m+[0m[0m update_config {
          [32m+[0m[0m max_unavailable = 1
        }
    }

[1m  # aws_iam_openid_connect_provider.eks[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_openid_connect_provider" "eks" {
      [32m+[0m[0m arn             = (known after apply)
      [32m+[0m[0m client_id_list  = [
          [32m+[0m[0m "sts.amazonaws.com",
        ]
      [32m+[0m[0m id              = (known after apply)
      [32m+[0m[0m tags_all        = (known after apply)
      [32m+[0m[0m thumbprint_list = (known after apply)
      [32m+[0m[0m url             = (known after apply)
    }

[1m  # aws_iam_policy.eks_cluster_autoscaler[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_policy" "eks_cluster_autoscaler" {
      [32m+[0m[0m arn         = (known after apply)
      [32m+[0m[0m id          = (known after apply)
      [32m+[0m[0m name        = "eks-cluster-autoscaler"
      [32m+[0m[0m name_prefix = (known after apply)
      [32m+[0m[0m path        = "/"
      [32m+[0m[0m policy      = jsonencode(
            {
              [32m+[0m[0m Statement = [
                  [32m+[0m[0m {
                      [32m+[0m[0m Action   = [
                          [32m+[0m[0m "autoscaling:DescribeAutoScalingGroups",
                          [32m+[0m[0m "autoscaling:DescribeAutoScalingInstances",
                          [32m+[0m[0m "autoscaling:DescribeLaunchConfigurations",
                          [32m+[0m[0m "autoscaling:DescribeTags",
                          [32m+[0m[0m "autoscaling:SetDesiredCapacity",
                          [32m+[0m[0m "autoscaling:TerminateInstanceInAutoScalingGroup",
                          [32m+[0m[0m "ec2:DescribeLaunchTemplateVersions",
                          [32m+[0m[0m "ec2:DescribeInstanceTypes",
                        ]
                      [32m+[0m[0m Effect   = "Allow"
                      [32m+[0m[0m Resource = "*"
                    },
                ]
              [32m+[0m[0m Version   = "2012-10-17"
            }
        )
      [32m+[0m[0m policy_id   = (known after apply)
      [32m+[0m[0m tags_all    = (known after apply)
    }

[1m  # aws_iam_policy.test_policy[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_policy" "test_policy" {
      [32m+[0m[0m arn         = (known after apply)
      [32m+[0m[0m id          = (known after apply)
      [32m+[0m[0m name        = "test-policy"
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

[1m  # aws_iam_role.eks_cluster_autoscaler[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role" "eks_cluster_autoscaler" {
      [32m+[0m[0m arn                   = (known after apply)
      [32m+[0m[0m assume_role_policy    = (known after apply)
      [32m+[0m[0m create_date           = (known after apply)
      [32m+[0m[0m force_detach_policies = false
      [32m+[0m[0m id                    = (known after apply)
      [32m+[0m[0m managed_policy_arns   = (known after apply)
      [32m+[0m[0m max_session_duration  = 3600
      [32m+[0m[0m name                  = "eks-cluster-autoscaler"
      [32m+[0m[0m name_prefix           = (known after apply)
      [32m+[0m[0m path                  = "/"
      [32m+[0m[0m role_last_used        = (known after apply)
      [32m+[0m[0m tags_all              = (known after apply)
      [32m+[0m[0m unique_id             = (known after apply)
    }

[1m  # aws_iam_role.test_oidc[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role" "test_oidc" {
      [32m+[0m[0m arn                   = (known after apply)
      [32m+[0m[0m assume_role_policy    = (known after apply)
      [32m+[0m[0m create_date           = (known after apply)
      [32m+[0m[0m force_detach_policies = false
      [32m+[0m[0m id                    = (known after apply)
      [32m+[0m[0m managed_policy_arns   = (known after apply)
      [32m+[0m[0m max_session_duration  = 3600
      [32m+[0m[0m name                  = "test-oidc"
      [32m+[0m[0m name_prefix           = (known after apply)
      [32m+[0m[0m path                  = "/"
      [32m+[0m[0m role_last_used        = (known after apply)
      [32m+[0m[0m tags_all              = (known after apply)
      [32m+[0m[0m unique_id             = (known after apply)
    }

[1m  # aws_iam_role_policy_attachment.eks_cluster_autoscaler_attach[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "eks_cluster_autoscaler_attach" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = (known after apply)
      [32m+[0m[0m role       = "eks-cluster-autoscaler"
    }

[1m  # aws_iam_role_policy_attachment.test_attach[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "test_attach" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = (known after apply)
      [32m+[0m[0m role       = "test-oidc"
    }

[1mPlan:[0m 9 to add, 0 to change, 0 to destroy.
[0m
Changes to Outputs:
  [32m+[0m[0m eks_cluster_autoscaler_arn = (known after apply)
  [32m+[0m[0m test_policy_arn            = (known after apply)
[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
