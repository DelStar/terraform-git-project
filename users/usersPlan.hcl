[0m[1mdata.aws_iam_policy_document.admin: Reading...[0m[0m
[0m[1mdata.aws_eks_cluster_auth.demo_cluster: Reading...[0m[0m
[0m[1mdata.aws_caller_identity.current: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.developer: Reading...[0m[0m
[0m[1mdata.aws_eks_cluster.demo_cluster: Reading...[0m[0m
[0m[1maws_iam_user.aws_admin_user: Refreshing state... [id=aws-admin-user][0m
[0m[1maws_iam_group.eks_developer: Refreshing state... [id=Developer][0m
[0m[1maws_iam_group.aws_admin_group: Refreshing state... [id=AWSAdminGroup][0m
[0m[1maws_iam_account_password_policy.strict: Refreshing state... [id=iam-account-password-policy][0m
[0m[1maws_iam_role.aws_admin_role: Refreshing state... [id=AWSAdminRole][0m
[0m[1mdata.aws_iam_policy_document.developer: Read complete after 0s [id=3146063397][0m
[0m[1mdata.aws_iam_policy_document.admin: Read complete after 0s [id=236601581][0m
[0m[1mdata.aws_eks_cluster_auth.demo_cluster: Read complete after 0s [id=demo-cluster][0m
[0m[1maws_iam_user.eks_user[1]: Refreshing state... [id=manager][0m
[0m[1maws_iam_policy.eks_admin: Refreshing state... [id=arn:aws:iam::730335426441:policy/eks-admin][0m
[0m[1maws_iam_user.eks_user[0]: Refreshing state... [id=developer][0m
[0m[1mdata.aws_caller_identity.current: Read complete after 0s [id=730335426441][0m
[0m[1mdata.aws_iam_policy_document.manager_assume_role: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.manager_assume_role: Read complete after 0s [id=116966695][0m
[0m[1maws_iam_role.eks_managers: Refreshing state... [id=manager_eks_role][0m
[0m[1maws_iam_group_policy.developer_policy: Refreshing state... [id=Developer:developer][0m
[0m[1maws_iam_user_login_profile.DB_user[1]: Refreshing state... [id=manager][0m
[0m[1maws_iam_group_membership.aws_admin_user_membership: Refreshing state... [id=aws-admin-user-membership][0m
[0m[1maws_iam_group_membership.db_team: Refreshing state... [id=dev-group-membership][0m
[0m[1maws_iam_user_login_profile.DB_user[0]: Refreshing state... [id=developer][0m
[0m[1mdata.aws_eks_cluster.demo_cluster: Read complete after 0s [id=demo-cluster][0m
[0m[1maws_iam_role_policy_attachment.admin_policy: Refreshing state... [id=manager_eks_role-20240218012817965500000002][0m
[0m[1maws_iam_role_policy.terraform_operations: Refreshing state... [id=AWSAdminRole:TerraformOperations][0m
[0m[1maws_iam_role_policy.view_resources: Refreshing state... [id=AWSAdminRole:ViewAllResources][0m
[0m[1maws_iam_role_policy.access_logs: Refreshing state... [id=AWSAdminRole:AccessLogs][0m
[0m[1maws_iam_policy.assume_role_policy: Refreshing state... [id=arn:aws:iam::730335426441:policy/assume-aws-admin-role-policy][0m
[0m[1maws_iam_group_policy_attachment.assume_role_policy_attachment: Refreshing state... [id=AWSAdminGroup-20240218012810705200000001][0m
[0m[1mkubernetes_service.superset_lb: Refreshing state... [id=default/superset][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m
  [31m-[0m destroy[0m

Terraform will perform the following actions:

[1m  # kubernetes_deployment.superset[0m will be created
[0m  [32m+[0m[0m resource "kubernetes_deployment" "superset" {
      [32m+[0m[0m id               = (known after apply)
      [32m+[0m[0m wait_for_rollout = true

      [32m+[0m[0m metadata {
          [32m+[0m[0m generation       = (known after apply)
          [32m+[0m[0m name             = "superset"
          [32m+[0m[0m namespace        = "default"
          [32m+[0m[0m resource_version = (known after apply)
          [32m+[0m[0m uid              = (known after apply)
        }

      [32m+[0m[0m spec {
          [32m+[0m[0m min_ready_seconds         = 0
          [32m+[0m[0m paused                    = false
          [32m+[0m[0m progress_deadline_seconds = 600
          [32m+[0m[0m replicas                  = "1"
          [32m+[0m[0m revision_history_limit    = 10

          [32m+[0m[0m selector {
              [32m+[0m[0m match_labels = {
                  [32m+[0m[0m "app" = "superset"
                }
            }

          [32m+[0m[0m template {
              [32m+[0m[0m metadata {
                  [32m+[0m[0m generation       = (known after apply)
                  [32m+[0m[0m labels           = {
                      [32m+[0m[0m "app" = "superset"
                    }
                  [32m+[0m[0m name             = (known after apply)
                  [32m+[0m[0m resource_version = (known after apply)
                  [32m+[0m[0m uid              = (known after apply)
                }
              [32m+[0m[0m spec {
                  [32m+[0m[0m automount_service_account_token  = true
                  [32m+[0m[0m dns_policy                       = "ClusterFirst"
                  [32m+[0m[0m enable_service_links             = true
                  [32m+[0m[0m host_ipc                         = false
                  [32m+[0m[0m host_network                     = false
                  [32m+[0m[0m host_pid                         = false
                  [32m+[0m[0m hostname                         = (known after apply)
                  [32m+[0m[0m node_name                        = (known after apply)
                  [32m+[0m[0m restart_policy                   = "Always"
                  [32m+[0m[0m scheduler_name                   = (known after apply)
                  [32m+[0m[0m service_account_name             = (known after apply)
                  [32m+[0m[0m share_process_namespace          = false
                  [32m+[0m[0m termination_grace_period_seconds = 30

                  [32m+[0m[0m container {
                      [32m+[0m[0m image                      = "apache/superset"
                      [32m+[0m[0m image_pull_policy          = (known after apply)
                      [32m+[0m[0m name                       = "superset"
                      [32m+[0m[0m stdin                      = false
                      [32m+[0m[0m stdin_once                 = false
                      [32m+[0m[0m termination_message_path   = "/dev/termination-log"
                      [32m+[0m[0m termination_message_policy = (known after apply)
                      [32m+[0m[0m tty                        = false

                      [32m+[0m[0m env {
                          [32m+[0m[0m name  = "SUPERSET_DB_URI"
                          [32m+[0m[0m value = "mysql://myuser:mypassword@localhost:3306/superset_db"
                        }

                      [32m+[0m[0m port {
                          [32m+[0m[0m container_port = 8088
                          [32m+[0m[0m protocol       = "TCP"
                        }

                      [32m+[0m[0m resources {
                          [32m+[0m[0m limits   = {
                              [32m+[0m[0m "cpu"    = "1000m"
                              [32m+[0m[0m "memory" = "1024Mi"
                            }
                          [32m+[0m[0m requests = {
                              [32m+[0m[0m "cpu"    = "500m"
                              [32m+[0m[0m "memory" = "512Mi"
                            }
                        }
                    }
                }
            }
        }
    }

[1m  # kubernetes_service.superset_lb[0m will be [1m[31mdestroyed[0m
  # (because kubernetes_service.superset_lb is not in configuration)
[0m  [31m-[0m[0m resource "kubernetes_service" "superset_lb" {
      [31m-[0m[0m id                     = "default/superset" [90m-> null[0m[0m
      [31m-[0m[0m status                 = [
          [31m-[0m[0m {
              [31m-[0m[0m load_balancer = [
                  [31m-[0m[0m {
                      [31m-[0m[0m ingress = []
                    },
                ]
            },
        ] [90m-> null[0m[0m
      [31m-[0m[0m wait_for_load_balancer = true [90m-> null[0m[0m

      [31m-[0m[0m metadata {
          [31m-[0m[0m annotations      = {
              [31m-[0m[0m "service.beta.kubernetes.io/aws-load-balancer-subnet" = "subnet-0aec9ef6bbbfe752e,subnet-0f0e4632b38a4494a"
            } [90m-> null[0m[0m
          [31m-[0m[0m generation       = 0 [90m-> null[0m[0m
          [31m-[0m[0m labels           = {} [90m-> null[0m[0m
          [31m-[0m[0m name             = "superset" [90m-> null[0m[0m
          [31m-[0m[0m namespace        = "default" [90m-> null[0m[0m
          [31m-[0m[0m resource_version = "240344" [90m-> null[0m[0m
          [31m-[0m[0m uid              = "8c86fc35-0ceb-4eff-ab48-6db4c6c722e6" [90m-> null[0m[0m
        }

      [31m-[0m[0m spec {
          [31m-[0m[0m allocate_load_balancer_node_ports = true [90m-> null[0m[0m
          [31m-[0m[0m cluster_ip                        = "172.20.167.248" [90m-> null[0m[0m
          [31m-[0m[0m cluster_ips                       = [
              [31m-[0m[0m "172.20.167.248",
            ] [90m-> null[0m[0m
          [31m-[0m[0m external_ips                      = [] [90m-> null[0m[0m
          [31m-[0m[0m external_traffic_policy           = "Cluster" [90m-> null[0m[0m
          [31m-[0m[0m health_check_node_port            = 0 [90m-> null[0m[0m
          [31m-[0m[0m internal_traffic_policy           = "Cluster" [90m-> null[0m[0m
          [31m-[0m[0m ip_families                       = [
              [31m-[0m[0m "IPv4",
            ] [90m-> null[0m[0m
          [31m-[0m[0m ip_family_policy                  = "SingleStack" [90m-> null[0m[0m
          [31m-[0m[0m load_balancer_source_ranges       = [] [90m-> null[0m[0m
          [31m-[0m[0m publish_not_ready_addresses       = false [90m-> null[0m[0m
          [31m-[0m[0m selector                          = {
              [31m-[0m[0m "app" = "superset"
            } [90m-> null[0m[0m
          [31m-[0m[0m session_affinity                  = "None" [90m-> null[0m[0m
          [31m-[0m[0m type                              = "LoadBalancer" [90m-> null[0m[0m

          [31m-[0m[0m port {
              [31m-[0m[0m node_port   = 31298 [90m-> null[0m[0m
              [31m-[0m[0m port        = 80 [90m-> null[0m[0m
              [31m-[0m[0m protocol    = "TCP" [90m-> null[0m[0m
              [31m-[0m[0m target_port = "8088" [90m-> null[0m[0m
            }
        }
    }

[1mPlan:[0m 1 to add, 0 to change, 1 to destroy.
[0m[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
