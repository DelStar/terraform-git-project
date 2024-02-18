provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      team = "SRE Project"
    }
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.demo_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.demo_cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.demo_cluster.token
  }
}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.demo_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.demo_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.demo_cluster.token
}

data "aws_eks_cluster" "demo_cluster" {
  name = "demo-cluster"
}

data "aws_eks_cluster_auth" "demo_cluster" {
  name = "demo-cluster"
}
