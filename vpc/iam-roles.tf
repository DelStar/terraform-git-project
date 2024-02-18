# Local variables to organize and list required IAM policies for EKS cluster and nodes
locals {
  # Policies necessary for the EKS cluster itself
  eks_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", # Grants permissions for cluster management
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"  # Grants access to EKS-related services
  ]

  # Policies needed for worker nodes within the cluster
  node_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",          # Allows nodes to join the cluster
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",               # Manages networking for pods
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", # Grants read access to ECR
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"                 # Provides full access to EC2 resources (potentially restrictive, consider granular permissions)
  ]
}

# --- IAM Role for Node Groups ---

# Create an IAM role specifically for node groups within the EKS cluster
resource "aws_iam_role" "nodes" {
  name               = "eks-node-group-nodes"
  assume_role_policy = data.aws_iam_policy_document.nodes.json # Assume role policy defined elsewhere
}

# Attach each required policy to the node role
resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  for_each   = toset(local.node_policies)
  policy_arn = each.value
  role       = aws_iam_role.nodes.name
}

# --- IAM Role for EKS Cluster ---

# Create an IAM role specifically for the EKS cluster itself
resource "aws_iam_role" "demo_cluster" {
  name               = "eks-cluster-demo-cluster"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json # Assume role policy defined elsewhere
}

# Attach each required policy to the cluster role
resource "aws_iam_role_policy_attachment" "demo_cluster-AmazonEKSClusterPolicy" {
  for_each   = toset(local.eks_policies)
  policy_arn = each.value
  role       = aws_iam_role.demo_cluster.name
}
