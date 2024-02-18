[0m[1mdata.terraform_remote_state.network: Reading...[0m[0m
[0m[1mdata.terraform_remote_state.network: Read complete after 0s[0m
[0m[1maws_iam_policy.eks_cluster_autoscaler: Refreshing state... [id=arn:aws:iam::730335426441:policy/eks-cluster-autoscaler][0m
[0m[1maws_iam_policy.test_policy: Refreshing state... [id=arn:aws:iam::730335426441:policy/test-policy][0m
[0m[1maws_eks_cluster.demo_cluster: Refreshing state... [id=demo-cluster][0m
[0m[1mdata.tls_certificate.eks: Reading...[0m[0m
[0m[1maws_eks_node_group.private-nodes: Refreshing state... [id=demo-cluster:private-nodes][0m
[0m[1mdata.tls_certificate.eks: Read complete after 0s [id=5933588ce34e24e9fb40c3565fb0b5993639df67][0m
[0m[1maws_iam_openid_connect_provider.eks: Refreshing state... [id=arn:aws:iam::730335426441:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/856F5D7FAB4B2EAD0AECA588A844322B][0m
[0m[1mdata.aws_iam_policy_document.eks_cluster_autoscaler_assume_role_policy: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.test_oidc_assume_role_policy: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.test_oidc_assume_role_policy: Read complete after 0s [id=3503283889][0m
[0m[1mdata.aws_iam_policy_document.eks_cluster_autoscaler_assume_role_policy: Read complete after 0s [id=131097804][0m
[0m[1maws_iam_role.eks_cluster_autoscaler: Refreshing state... [id=eks-cluster-autoscaler][0m
[0m[1maws_iam_role.test_oidc: Refreshing state... [id=test-oidc][0m
[0m[1maws_iam_role_policy_attachment.test_attach: Refreshing state... [id=test-oidc-20240218012222371400000003][0m
[0m[1maws_iam_role_policy_attachment.eks_cluster_autoscaler_attach: Refreshing state... [id=eks-cluster-autoscaler-20240218012222365900000002][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [33m~[0m update in-place[0m

Terraform will perform the following actions:

[1m  # aws_eks_node_group.private-nodes[0m will be updated in-place
[0m  [33m~[0m[0m resource "aws_eks_node_group" "private-nodes" {
        id              = "demo-cluster:private-nodes"
        tags            = {
            "k8s.io/cluster-autoscaler/demo_cluster" = "owned"
            "k8s.io/cluster-autoscaler/enabled"      = "true"
        }
        [90m# (15 unchanged attributes hidden)[0m[0m

      [33m~[0m[0m scaling_config {
          [33m~[0m[0m desired_size = 1 [33m->[0m[0m 2
            [90m# (2 unchanged attributes hidden)[0m[0m
        }

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1mPlan:[0m 0 to add, 1 to change, 0 to destroy.
[0m[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
