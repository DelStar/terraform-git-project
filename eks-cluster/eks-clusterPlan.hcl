[0m[1mdata.terraform_remote_state.network: Reading...[0m[0m
[0m[1mdata.terraform_remote_state.network: Read complete after 0s[0m
[0m[1mdata.aws_eks_cluster.demo_cluster: Reading...[0m[0m
[0m[1maws_iam_policy.eks_cluster_autoscaler: Refreshing state... [id=arn:aws:iam::730335426441:policy/eks-cluster-autoscaler][0m
[0m[1maws_iam_policy.test_policy: Refreshing state... [id=arn:aws:iam::730335426441:policy/test-policy][0m
[0m[1maws_eks_cluster.demo_cluster: Refreshing state... [id=demo-cluster][0m
[0m[1mdata.aws_eks_cluster.demo_cluster: Read complete after 1s [id=demo-cluster][0m
[0m[1mdata.tls_certificate.eks: Reading...[0m[0m
[0m[1maws_eks_node_group.private-nodes: Refreshing state... [id=demo-cluster:private-nodes][0m
[0m[1mdata.tls_certificate.eks: Read complete after 0s [id=5933588ce34e24e9fb40c3565fb0b5993639df67][0m
[0m[1maws_iam_openid_connect_provider.eks: Refreshing state... [id=arn:aws:iam::730335426441:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/856F5D7FAB4B2EAD0AECA588A844322B][0m
[0m[1mdata.aws_iam_policy_document.test_oidc_assume_role_policy: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.eks_cluster_autoscaler_assume_role_policy: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.test_oidc_assume_role_policy: Read complete after 0s [id=3591803784][0m
[0m[1mdata.aws_iam_policy_document.eks_cluster_autoscaler_assume_role_policy: Read complete after 0s [id=131097804][0m
[0m[1maws_iam_role.test_oidc: Refreshing state... [id=test-oidc][0m
[0m[1maws_iam_role.eks_cluster_autoscaler: Refreshing state... [id=eks-cluster-autoscaler][0m
[0m[1maws_iam_role_policy_attachment.test_attach: Refreshing state... [id=test-oidc-20240218012222371400000003][0m
[0m[1maws_iam_role_policy_attachment.eks_cluster_autoscaler_attach: Refreshing state... [id=eks-cluster-autoscaler-20240218012222365900000002][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
[31m-[0m/[32m+[0m destroy and then create replacement[0m

Terraform will perform the following actions:

[1m  # aws_eks_node_group.private-nodes[0m must be [1m[31mreplaced[0m
[0m[31m-[0m/[32m+[0m[0m resource "aws_eks_node_group" "private-nodes" {
      [33m~[0m[0m ami_type               = "AL2_x86_64" -> (known after apply)
      [33m~[0m[0m arn                    = "arn:aws:eks:us-east-1:730335426441:nodegroup/demo-cluster/private-nodes/c4c6dce7-4a88-ea2d-933c-bcb88e0baf1c" -> (known after apply)
      [33m~[0m[0m capacity_type          = "SPOT" [33m->[0m[0m "ON_DEMAND" [31m# forces replacement[0m[0m
      [33m~[0m[0m disk_size              = 20 -> (known after apply)
      [33m~[0m[0m id                     = "demo-cluster:private-nodes" -> (known after apply)
      [32m+[0m[0m node_group_name_prefix = (known after apply)
      [33m~[0m[0m release_version        = "1.29.0-20240213" -> (known after apply)
      [33m~[0m[0m resources              = [
          [31m-[0m[0m {
              [31m-[0m[0m autoscaling_groups              = [
                  [31m-[0m[0m {
                      [31m-[0m[0m name = "eks-private-nodes-c4c6dce7-4a88-ea2d-933c-bcb88e0baf1c"
                    },
                ]
              [31m-[0m[0m remote_access_security_group_id = ""
            },
        ] -> (known after apply)
      [33m~[0m[0m status                 = "DEGRADED" -> (known after apply)
        tags                   = {
            "k8s.io/cluster-autoscaler/demo-cluster" = "owned"
            "k8s.io/cluster-autoscaler/enabled"      = "true"
            "k8s.io/cluster/demo-cluster"            = "owned"
            "kubernetes.io/role/elb"                 = "1"
        }
      [33m~[0m[0m version                = "1.29" -> (known after apply)
        [90m# (7 unchanged attributes hidden)[0m[0m

      [33m~[0m[0m update_config {
          [31m-[0m[0m max_unavailable_percentage = 0 [90m-> null[0m[0m
            [90m# (1 unchanged attribute hidden)[0m[0m
        }

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1mPlan:[0m 1 to add, 0 to change, 1 to destroy.
[0m[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
