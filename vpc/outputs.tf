output "private_subnet_ids" {
  description = "List of IDs for all private subnets in the VPC"
  value       = aws_subnet.private.*.id
}

output "public_subnet_ids" {
  description = "List of IDs for all public subnets in the VPC"
  value       = aws_subnet.public.*.id
}

output "node_role_arn" {
  description = "ARN of the IAM role for nodes"
  value       = aws_iam_role.demo_cluster.arn
}

output "demo_cluster_role_arn" {
  description = "ARN of the IAM role for the main cluster 'demo_cluster'"
  value       = aws_iam_role.nodes.arn
}

output "subnet_ids" {
  value = [
    for subnet in aws_subnet.private : subnet.id
  ]
}




