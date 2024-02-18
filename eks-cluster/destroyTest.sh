#!/bin/bash

cd ../vpc
terraform  destroy -auto-approve
echo "VPC destroyed!"
echo "All destroying complete!"
echo "Thank you for using this script!"
