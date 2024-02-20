
output "password" {
  value = aws_iam_user_login_profile.DB_user.*.encrypted_password
  # 'password | base64 --decode | keybase pgp decrypt'
}

output "eks_managers_role_name" {
  value = aws_iam_role.eks_managers.name
}

