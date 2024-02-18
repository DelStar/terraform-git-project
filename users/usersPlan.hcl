[0m[1mdata.aws_caller_identity.current: Reading...[0m[0m
[0m[1maws_iam_account_password_policy.strict: Refreshing state... [id=iam-account-password-policy][0m
[0m[1maws_iam_user.eks_user[1]: Refreshing state... [id=manager][0m
[0m[1mdata.aws_eks_cluster_auth.demo_cluster: Reading...[0m[0m
[0m[1maws_iam_group.eks_developer: Refreshing state... [id=Developer][0m
[0m[1maws_iam_user.aws_admin_user: Refreshing state... [id=aws-admin-user][0m
[0m[1maws_iam_group.aws_admin_group: Refreshing state... [id=AWSAdminGroup][0m
[0m[1maws_iam_role.aws_admin_role: Refreshing state... [id=AWSAdminRole][0m
[0m[1mdata.aws_iam_policy_document.developer: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.admin: Reading...[0m[0m
[0m[1mdata.aws_eks_cluster_auth.demo_cluster: Read complete after 0s [id=demo-cluster][0m
[0m[1maws_iam_user.eks_user[0]: Refreshing state... [id=developer][0m
[0m[1mdata.aws_iam_policy_document.developer: Read complete after 0s [id=3146063397][0m
[0m[1mdata.aws_iam_policy_document.admin: Read complete after 0s [id=236601581][0m
[0m[1mdata.aws_eks_cluster.demo_cluster: Reading...[0m[0m
[0m[1maws_iam_policy.eks_admin: Refreshing state... [id=arn:aws:iam::730335426441:policy/eks-admin][0m
[0m[1maws_iam_group_membership.aws_admin_user_membership: Refreshing state... [id=aws-admin-user-membership][0m
[0m[1maws_iam_group_policy.developer_policy: Refreshing state... [id=Developer:developer][0m
[0m[1mdata.aws_caller_identity.current: Read complete after 0s [id=730335426441][0m
[0m[1maws_iam_group_membership.db_team: Refreshing state... [id=dev-group-membership][0m
[0m[1maws_iam_user_login_profile.DB_user[1]: Refreshing state... [id=manager][0m
[0m[1maws_iam_user_login_profile.DB_user[0]: Refreshing state... [id=developer][0m
[0m[1mdata.aws_iam_policy_document.manager_assume_role: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.manager_assume_role: Read complete after 0s [id=116966695][0m
[0m[1maws_iam_role.eks_managers: Refreshing state... [id=manager_eks_role][0m
[0m[1mdata.aws_eks_cluster.demo_cluster: Read complete after 0s [id=demo-cluster][0m
[0m[1maws_iam_role_policy_attachment.admin_policy: Refreshing state... [id=manager_eks_role-20240218012817965500000002][0m
[0m[1maws_iam_role_policy.view_resources: Refreshing state... [id=AWSAdminRole:ViewAllResources][0m
[0m[1maws_iam_role_policy.terraform_operations: Refreshing state... [id=AWSAdminRole:TerraformOperations][0m
[0m[1maws_iam_role_policy.access_logs: Refreshing state... [id=AWSAdminRole:AccessLogs][0m
[0m[1maws_iam_policy.assume_role_policy: Refreshing state... [id=arn:aws:iam::730335426441:policy/assume-aws-admin-role-policy][0m
[0m[1maws_iam_group_policy_attachment.assume_role_policy_attachment: Refreshing state... [id=AWSAdminGroup-20240218012810705200000001][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m

Terraform will perform the following actions:

[1m  # module.nginx-controller.helm_release.application[0m will be created
[0m  [32m+[0m[0m resource "helm_release" "application" {
      [32m+[0m[0m atomic                     = false
      [32m+[0m[0m chart                      = "ingress-nginx"
      [32m+[0m[0m cleanup_on_fail            = false
      [32m+[0m[0m create_namespace           = false
      [32m+[0m[0m dependency_update          = false
      [32m+[0m[0m disable_crd_hooks          = false
      [32m+[0m[0m disable_openapi_validation = false
      [32m+[0m[0m disable_webhooks           = false
      [32m+[0m[0m force_update               = false
      [32m+[0m[0m id                         = (known after apply)
      [32m+[0m[0m lint                       = false
      [32m+[0m[0m manifest                   = (known after apply)
      [32m+[0m[0m max_history                = 0
      [32m+[0m[0m metadata                   = (known after apply)
      [32m+[0m[0m name                       = "ingress-nginx"
      [32m+[0m[0m namespace                  = "kube-system"
      [32m+[0m[0m pass_credentials           = false
      [32m+[0m[0m recreate_pods              = false
      [32m+[0m[0m render_subchart_notes      = true
      [32m+[0m[0m replace                    = false
      [32m+[0m[0m repository                 = "https://kubernetes.github.io/ingress-nginx"
      [32m+[0m[0m reset_values               = false
      [32m+[0m[0m reuse_values               = false
      [32m+[0m[0m skip_crds                  = false
      [32m+[0m[0m status                     = "deployed"
      [32m+[0m[0m timeout                    = 300
      [32m+[0m[0m values                     = [
          [32m+[0m[0m "",
        ]
      [32m+[0m[0m verify                     = false
      [32m+[0m[0m version                    = "4.5.2"
      [32m+[0m[0m wait                       = true
      [32m+[0m[0m wait_for_jobs              = false

      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.daemonset.useHostPort"
          [32m+[0m[0m value = "false"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.ingressClassResource.default"
          [32m+[0m[0m value = "true"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.ingressClassResource.name"
          [32m+[0m[0m value = "nginx"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.kind"
          [32m+[0m[0m value = "DaemonSet"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.publishService.enabled"
          [32m+[0m[0m value = "true"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.resources.requests.memory"
          [32m+[0m[0m type  = "string"
          [32m+[0m[0m value = "140Mi"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"
          [32m+[0m[0m type  = "string"
          [32m+[0m[0m value = "true"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
          [32m+[0m[0m type  = "string"
          [32m+[0m[0m value = "nlb"
        }
      [32m+[0m[0m set {
          [32m+[0m[0m name  = "controller.service.externalTrafficPolicy"
          [32m+[0m[0m value = "Local"
        }
    }

[1mPlan:[0m 1 to add, 0 to change, 0 to destroy.
[0m[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
