#!/bin/bash

# Change directory to users
cd users || exit

# Create IAM Users and Roles along with their policies
terraform init
terraform fmt
terraform validate && terraform plan >usersPlan.hcl
terraform apply -auto-approve