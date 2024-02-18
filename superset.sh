#!/bin/bash

# This SuperSet setup for this project is based on the following:
# https://github.com/mlflow/mlflow/blob/master/examples/sklearn_elasticnet_wine/setup.sh
# I am using EKS Cluster (demo-cluster) for the setup
# Run these commands to update my kubectl config
aws eks update-kubeconfig --name demo-cluster --region us-east-1
kubens kube-system
kubectl get nodes
kubectl get configmap
kubectl describe configmap aws-auth
kubectl edit configmap aws-auth

# Add  the Superset helm repository
helm repo add superset https://apache.github.io/superset

helm search repo superset

