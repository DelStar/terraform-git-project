#!/bin/bash
echo "Destroying the resources..."
echo "Please wait..."

cd eks-cluster
terraform destroy -auto-approve
echo "EKS-CLUSTER DESTROYED!"