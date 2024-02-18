# Creating EKS Cluster
resource "aws_eks_cluster" "demo_cluster" {
  name     = "demo-cluster"
  role_arn = data.terraform_remote_state.network.outputs.node_role_arn

  vpc_config {
    subnet_ids = [
      data.terraform_remote_state.network.outputs.public_subnet_ids[0], data.terraform_remote_state.network.outputs.public_subnet_ids[1],
      data.terraform_remote_state.network.outputs.private_subnet_ids[0], data.terraform_remote_state.network.outputs.private_subnet_ids[1]
    ]
  }
}
