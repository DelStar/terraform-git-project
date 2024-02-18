#!/bin/bash

# Change directory to vpc
cd vpc || exit

# Create the vpc 
terraform init
terraform fmt
terraform validate && terraform plan >vpc_plan

if [ "$?" -eq "0" ]; then
  echo "The code has been successfully validated"
  echo "You can review the plan file in vpc_plan"
  sleep 2
else
  echo "The code needs some review!"
  exit
fi
terraform apply -auto-approve

echo "VPC is successfully created"
