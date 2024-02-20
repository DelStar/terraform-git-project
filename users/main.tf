# Defineing IAM users based on a list of usernames
resource "aws_iam_user_login_profile" "DB_user" {
  count                   = length(var.username)
  user                    = aws_iam_user.eks_user[count.index].name
  password_reset_required = true
  pgp_key                 = "keybase:daleybase"
}

# Creating login profile with password reset required and a PGP key reference
resource "aws_iam_user" "eks_user" {
  count         = length(var.username)
  name          = element(var.username, count.index)
  force_destroy = true

  tags = {
    Department = "eks-user"
  }
}

# Defining an IAM group that can assume the EKS Role
resource "aws_iam_group" "eks_developer" {
  name = "Developer"
}

# Attaching a custom policy to the group
resource "aws_iam_group_policy" "developer_policy" {
  name   = "developer"
  group  = aws_iam_group.eks_developer.name
  policy = data.aws_iam_policy_document.developer.json
}

# Adding the first user to the group
resource "aws_iam_group_membership" "db_team" {
  name  = "dev-group-membership"
  users = [aws_iam_user.eks_user[0].name]
  group = aws_iam_group.eks_developer.name
}

# Enforcing strict password policy for all users
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

# Defining a role for managers with assume role policy and attaching admin policy
resource "aws_iam_role" "eks_managers" {
  name               = "manager_eks_role" 
  assume_role_policy = data.aws_iam_policy_document.manager_assume_role.json
}


resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = aws_iam_role.eks_managers.name
  policy_arn = aws_iam_policy.eks_admin.arn
}

resource "aws_iam_policy" "eks_admin" {
  name   = "eks-admin"
  policy = data.aws_iam_policy_document.admin.json
}


output "eks_managers_arn" {
  value = aws_iam_role.eks_managers.arn
}


output "eks_admin_policy_arn" {
  value = aws_iam_policy.eks_admin.arn
}

output "manager_eks_role_name" {
  value = aws_iam_role.eks_managers.name  
}




resource "kubernetes_deployment" "superset" {
  metadata {
    name      = "superset"
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "superset"
      }
    }

    template {
      metadata {
        labels = {
          app = "superset"
        }
      }

      spec {
        container {
          image = "apache/superset"
          name  = "superset"

          env {
            name  = "SUPERSET_DB_URI"
            value = "mysql://myuser:mypassword@localhost:3306/superset_db"
          }

          resources {
            limits = {
              cpu    = "1000m"
              memory = "1024Mi"
            }
            requests = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }

          port {
            container_port = 8088
          }
        }
      }
    }
  }
}

