[0m[1mdata.external.vpc_name: Reading...[0m[0m
[0m[1mdata.external.vpc_name: Read complete after 0s [id=-][0m
[0m[1mdata.aws_iam_policy_document.nodes: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.eks_assume_role: Reading...[0m[0m
[0m[1mdata.aws_iam_policy_document.eks_assume_role: Read complete after 0s [id=542123937][0m
[0m[1mdata.aws_iam_policy_document.nodes: Read complete after 0s [id=1516362680][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m

Terraform will perform the following actions:

[1m  # aws_eip.nat[0m will be created
[0m  [32m+[0m[0m resource "aws_eip" "nat" {
      [32m+[0m[0m allocation_id        = (known after apply)
      [32m+[0m[0m association_id       = (known after apply)
      [32m+[0m[0m carrier_ip           = (known after apply)
      [32m+[0m[0m customer_owned_ip    = (known after apply)
      [32m+[0m[0m domain               = (known after apply)
      [32m+[0m[0m id                   = (known after apply)
      [32m+[0m[0m instance             = (known after apply)
      [32m+[0m[0m network_border_group = (known after apply)
      [32m+[0m[0m network_interface    = (known after apply)
      [32m+[0m[0m private_dns          = (known after apply)
      [32m+[0m[0m private_ip           = (known after apply)
      [32m+[0m[0m public_dns           = (known after apply)
      [32m+[0m[0m public_ip            = (known after apply)
      [32m+[0m[0m public_ipv4_pool     = (known after apply)
      [32m+[0m[0m tags                 = {
          [32m+[0m[0m "Name" = "nat-eip"
        }
      [32m+[0m[0m tags_all             = {
          [32m+[0m[0m "Name" = "nat-eip"
        }
      [32m+[0m[0m vpc                  = true
    }

[1m  # aws_iam_role.demo_cluster[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role" "demo_cluster" {
      [32m+[0m[0m arn                   = (known after apply)
      [32m+[0m[0m assume_role_policy    = jsonencode(
            {
              [32m+[0m[0m Statement = [
                  [32m+[0m[0m {
                      [32m+[0m[0m Action    = "sts:AssumeRole"
                      [32m+[0m[0m Effect    = "Allow"
                      [32m+[0m[0m Principal = {
                          [32m+[0m[0m Service = "eks.amazonaws.com"
                        }
                      [32m+[0m[0m Sid       = "AllowEKSAssumeRole"
                    },
                ]
              [32m+[0m[0m Version   = "2012-10-17"
            }
        )
      [32m+[0m[0m create_date           = (known after apply)
      [32m+[0m[0m force_detach_policies = false
      [32m+[0m[0m id                    = (known after apply)
      [32m+[0m[0m managed_policy_arns   = (known after apply)
      [32m+[0m[0m max_session_duration  = 3600
      [32m+[0m[0m name                  = "eks-cluster-demo-cluster"
      [32m+[0m[0m name_prefix           = (known after apply)
      [32m+[0m[0m path                  = "/"
      [32m+[0m[0m role_last_used        = (known after apply)
      [32m+[0m[0m tags_all              = (known after apply)
      [32m+[0m[0m unique_id             = (known after apply)
    }

[1m  # aws_iam_role.nodes[0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role" "nodes" {
      [32m+[0m[0m arn                   = (known after apply)
      [32m+[0m[0m assume_role_policy    = jsonencode(
            {
              [32m+[0m[0m Statement = [
                  [32m+[0m[0m {
                      [32m+[0m[0m Action    = "sts:AssumeRole"
                      [32m+[0m[0m Effect    = "Allow"
                      [32m+[0m[0m Principal = {
                          [32m+[0m[0m Service = "ec2.amazonaws.com"
                        }
                      [32m+[0m[0m Sid       = "AllowEKSAssumeRole"
                    },
                ]
              [32m+[0m[0m Version   = "2012-10-17"
            }
        )
      [32m+[0m[0m create_date           = (known after apply)
      [32m+[0m[0m force_detach_policies = false
      [32m+[0m[0m id                    = (known after apply)
      [32m+[0m[0m managed_policy_arns   = (known after apply)
      [32m+[0m[0m max_session_duration  = 3600
      [32m+[0m[0m name                  = "eks-node-group-nodes"
      [32m+[0m[0m name_prefix           = (known after apply)
      [32m+[0m[0m path                  = "/"
      [32m+[0m[0m role_last_used        = (known after apply)
      [32m+[0m[0m tags_all              = (known after apply)
      [32m+[0m[0m unique_id             = (known after apply)
    }

[1m  # aws_iam_role_policy_attachment.demo_cluster-AmazonEKSClusterPolicy["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"][0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "demo_cluster-AmazonEKSClusterPolicy" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      [32m+[0m[0m role       = "eks-cluster-demo-cluster"
    }

[1m  # aws_iam_role_policy_attachment.demo_cluster-AmazonEKSClusterPolicy["arn:aws:iam::aws:policy/AmazonEKSServicePolicy"][0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "demo_cluster-AmazonEKSClusterPolicy" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
      [32m+[0m[0m role       = "eks-cluster-demo-cluster"
    }

[1m  # aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"][0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      [32m+[0m[0m role       = "eks-node-group-nodes"
    }

[1m  # aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy["arn:aws:iam::aws:policy/AmazonEC2FullAccess"][0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
      [32m+[0m[0m role       = "eks-node-group-nodes"
    }

[1m  # aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"][0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      [32m+[0m[0m role       = "eks-node-group-nodes"
    }

[1m  # aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"][0m will be created
[0m  [32m+[0m[0m resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
      [32m+[0m[0m id         = (known after apply)
      [32m+[0m[0m policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      [32m+[0m[0m role       = "eks-node-group-nodes"
    }

[1m  # aws_internet_gateway.igw[0m will be created
[0m  [32m+[0m[0m resource "aws_internet_gateway" "igw" {
      [32m+[0m[0m arn      = (known after apply)
      [32m+[0m[0m id       = (known after apply)
      [32m+[0m[0m owner_id = (known after apply)
      [32m+[0m[0m tags     = {
          [32m+[0m[0m "Name" = "main-igw"
        }
      [32m+[0m[0m tags_all = {
          [32m+[0m[0m "Name" = "main-igw"
        }
      [32m+[0m[0m vpc_id   = (known after apply)
    }

[1m  # aws_nat_gateway.nat[0m will be created
[0m  [32m+[0m[0m resource "aws_nat_gateway" "nat" {
      [32m+[0m[0m allocation_id        = (known after apply)
      [32m+[0m[0m association_id       = (known after apply)
      [32m+[0m[0m connectivity_type    = "public"
      [32m+[0m[0m id                   = (known after apply)
      [32m+[0m[0m network_interface_id = (known after apply)
      [32m+[0m[0m private_ip           = (known after apply)
      [32m+[0m[0m public_ip            = (known after apply)
      [32m+[0m[0m subnet_id            = (known after apply)
      [32m+[0m[0m tags                 = {
          [32m+[0m[0m "Name" = "main-nat"
        }
      [32m+[0m[0m tags_all             = {
          [32m+[0m[0m "Name" = "main-nat"
        }
    }

[1m  # aws_route.private_nat_gateway[0m will be created
[0m  [32m+[0m[0m resource "aws_route" "private_nat_gateway" {
      [32m+[0m[0m destination_cidr_block = "0.0.0.0/0"
      [32m+[0m[0m id                     = (known after apply)
      [32m+[0m[0m instance_id            = (known after apply)
      [32m+[0m[0m instance_owner_id      = (known after apply)
      [32m+[0m[0m nat_gateway_id         = (known after apply)
      [32m+[0m[0m network_interface_id   = (known after apply)
      [32m+[0m[0m origin                 = (known after apply)
      [32m+[0m[0m route_table_id         = (known after apply)
      [32m+[0m[0m state                  = (known after apply)
    }

[1m  # aws_route.public_internet_gateway[0m will be created
[0m  [32m+[0m[0m resource "aws_route" "public_internet_gateway" {
      [32m+[0m[0m destination_cidr_block = "0.0.0.0/0"
      [32m+[0m[0m gateway_id             = (known after apply)
      [32m+[0m[0m id                     = (known after apply)
      [32m+[0m[0m instance_id            = (known after apply)
      [32m+[0m[0m instance_owner_id      = (known after apply)
      [32m+[0m[0m network_interface_id   = (known after apply)
      [32m+[0m[0m origin                 = (known after apply)
      [32m+[0m[0m route_table_id         = (known after apply)
      [32m+[0m[0m state                  = (known after apply)
    }

[1m  # aws_route_table.private[0m will be created
[0m  [32m+[0m[0m resource "aws_route_table" "private" {
      [32m+[0m[0m arn              = (known after apply)
      [32m+[0m[0m id               = (known after apply)
      [32m+[0m[0m owner_id         = (known after apply)
      [32m+[0m[0m propagating_vgws = (known after apply)
      [32m+[0m[0m route            = (known after apply)
      [32m+[0m[0m tags             = {
          [32m+[0m[0m "Name" = "main-private-rt"
        }
      [32m+[0m[0m tags_all         = {
          [32m+[0m[0m "Name" = "main-private-rt"
        }
      [32m+[0m[0m vpc_id           = (known after apply)
    }

[1m  # aws_route_table.public[0m will be created
[0m  [32m+[0m[0m resource "aws_route_table" "public" {
      [32m+[0m[0m arn              = (known after apply)
      [32m+[0m[0m id               = (known after apply)
      [32m+[0m[0m owner_id         = (known after apply)
      [32m+[0m[0m propagating_vgws = (known after apply)
      [32m+[0m[0m route            = (known after apply)
      [32m+[0m[0m tags             = {
          [32m+[0m[0m "Name" = "main-public-rt"
        }
      [32m+[0m[0m tags_all         = {
          [32m+[0m[0m "Name" = "main-public-rt"
        }
      [32m+[0m[0m vpc_id           = (known after apply)
    }

[1m  # aws_route_table_association.private[0][0m will be created
[0m  [32m+[0m[0m resource "aws_route_table_association" "private" {
      [32m+[0m[0m id             = (known after apply)
      [32m+[0m[0m route_table_id = (known after apply)
      [32m+[0m[0m subnet_id      = (known after apply)
    }

[1m  # aws_route_table_association.private[1][0m will be created
[0m  [32m+[0m[0m resource "aws_route_table_association" "private" {
      [32m+[0m[0m id             = (known after apply)
      [32m+[0m[0m route_table_id = (known after apply)
      [32m+[0m[0m subnet_id      = (known after apply)
    }

[1m  # aws_route_table_association.public[0][0m will be created
[0m  [32m+[0m[0m resource "aws_route_table_association" "public" {
      [32m+[0m[0m id             = (known after apply)
      [32m+[0m[0m route_table_id = (known after apply)
      [32m+[0m[0m subnet_id      = (known after apply)
    }

[1m  # aws_route_table_association.public[1][0m will be created
[0m  [32m+[0m[0m resource "aws_route_table_association" "public" {
      [32m+[0m[0m id             = (known after apply)
      [32m+[0m[0m route_table_id = (known after apply)
      [32m+[0m[0m subnet_id      = (known after apply)
    }

[1m  # aws_subnet.private[0][0m will be created
[0m  [32m+[0m[0m resource "aws_subnet" "private" {
      [32m+[0m[0m arn                                            = (known after apply)
      [32m+[0m[0m assign_ipv6_address_on_creation                = false
      [32m+[0m[0m availability_zone                              = "us-east-1a"
      [32m+[0m[0m availability_zone_id                           = (known after apply)
      [32m+[0m[0m cidr_block                                     = "10.0.0.0/19"
      [32m+[0m[0m enable_dns64                                   = false
      [32m+[0m[0m enable_resource_name_dns_a_record_on_launch    = false
      [32m+[0m[0m enable_resource_name_dns_aaaa_record_on_launch = false
      [32m+[0m[0m id                                             = (known after apply)
      [32m+[0m[0m ipv6_cidr_block_association_id                 = (known after apply)
      [32m+[0m[0m ipv6_native                                    = false
      [32m+[0m[0m map_public_ip_on_launch                        = false
      [32m+[0m[0m owner_id                                       = (known after apply)
      [32m+[0m[0m private_dns_hostname_type_on_launch            = (known after apply)
      [32m+[0m[0m tags                                           = {
          [32m+[0m[0m "Name"                               = "private-0"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m tags_all                                       = {
          [32m+[0m[0m "Name"                               = "private-0"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m vpc_id                                         = (known after apply)
    }

[1m  # aws_subnet.private[1][0m will be created
[0m  [32m+[0m[0m resource "aws_subnet" "private" {
      [32m+[0m[0m arn                                            = (known after apply)
      [32m+[0m[0m assign_ipv6_address_on_creation                = false
      [32m+[0m[0m availability_zone                              = "us-east-1b"
      [32m+[0m[0m availability_zone_id                           = (known after apply)
      [32m+[0m[0m cidr_block                                     = "10.0.32.0/19"
      [32m+[0m[0m enable_dns64                                   = false
      [32m+[0m[0m enable_resource_name_dns_a_record_on_launch    = false
      [32m+[0m[0m enable_resource_name_dns_aaaa_record_on_launch = false
      [32m+[0m[0m id                                             = (known after apply)
      [32m+[0m[0m ipv6_cidr_block_association_id                 = (known after apply)
      [32m+[0m[0m ipv6_native                                    = false
      [32m+[0m[0m map_public_ip_on_launch                        = false
      [32m+[0m[0m owner_id                                       = (known after apply)
      [32m+[0m[0m private_dns_hostname_type_on_launch            = (known after apply)
      [32m+[0m[0m tags                                           = {
          [32m+[0m[0m "Name"                               = "private-1"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m tags_all                                       = {
          [32m+[0m[0m "Name"                               = "private-1"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m vpc_id                                         = (known after apply)
    }

[1m  # aws_subnet.public[0][0m will be created
[0m  [32m+[0m[0m resource "aws_subnet" "public" {
      [32m+[0m[0m arn                                            = (known after apply)
      [32m+[0m[0m assign_ipv6_address_on_creation                = false
      [32m+[0m[0m availability_zone                              = "us-east-1a"
      [32m+[0m[0m availability_zone_id                           = (known after apply)
      [32m+[0m[0m cidr_block                                     = "10.0.64.0/19"
      [32m+[0m[0m enable_dns64                                   = false
      [32m+[0m[0m enable_resource_name_dns_a_record_on_launch    = false
      [32m+[0m[0m enable_resource_name_dns_aaaa_record_on_launch = false
      [32m+[0m[0m id                                             = (known after apply)
      [32m+[0m[0m ipv6_cidr_block_association_id                 = (known after apply)
      [32m+[0m[0m ipv6_native                                    = false
      [32m+[0m[0m map_public_ip_on_launch                        = true
      [32m+[0m[0m owner_id                                       = (known after apply)
      [32m+[0m[0m private_dns_hostname_type_on_launch            = (known after apply)
      [32m+[0m[0m tags                                           = {
          [32m+[0m[0m "Name"                               = "public-0"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m tags_all                                       = {
          [32m+[0m[0m "Name"                               = "public-0"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m vpc_id                                         = (known after apply)
    }

[1m  # aws_subnet.public[1][0m will be created
[0m  [32m+[0m[0m resource "aws_subnet" "public" {
      [32m+[0m[0m arn                                            = (known after apply)
      [32m+[0m[0m assign_ipv6_address_on_creation                = false
      [32m+[0m[0m availability_zone                              = "us-east-1b"
      [32m+[0m[0m availability_zone_id                           = (known after apply)
      [32m+[0m[0m cidr_block                                     = "10.0.96.0/19"
      [32m+[0m[0m enable_dns64                                   = false
      [32m+[0m[0m enable_resource_name_dns_a_record_on_launch    = false
      [32m+[0m[0m enable_resource_name_dns_aaaa_record_on_launch = false
      [32m+[0m[0m id                                             = (known after apply)
      [32m+[0m[0m ipv6_cidr_block_association_id                 = (known after apply)
      [32m+[0m[0m ipv6_native                                    = false
      [32m+[0m[0m map_public_ip_on_launch                        = true
      [32m+[0m[0m owner_id                                       = (known after apply)
      [32m+[0m[0m private_dns_hostname_type_on_launch            = (known after apply)
      [32m+[0m[0m tags                                           = {
          [32m+[0m[0m "Name"                               = "public-1"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m tags_all                                       = {
          [32m+[0m[0m "Name"                               = "public-1"
          [32m+[0m[0m "kubernetes.io/cluster/demo_cluster" = "owned"
          [32m+[0m[0m "kubernetes.io/role/elb"             = "1"
        }
      [32m+[0m[0m vpc_id                                         = (known after apply)
    }

[1m  # aws_vpc.main[0m will be created
[0m  [32m+[0m[0m resource "aws_vpc" "main" {
      [32m+[0m[0m arn                                  = (known after apply)
      [32m+[0m[0m cidr_block                           = "10.0.0.0/16"
      [32m+[0m[0m default_network_acl_id               = (known after apply)
      [32m+[0m[0m default_route_table_id               = (known after apply)
      [32m+[0m[0m default_security_group_id            = (known after apply)
      [32m+[0m[0m dhcp_options_id                      = (known after apply)
      [32m+[0m[0m enable_classiclink                   = (known after apply)
      [32m+[0m[0m enable_classiclink_dns_support       = (known after apply)
      [32m+[0m[0m enable_dns_hostnames                 = (known after apply)
      [32m+[0m[0m enable_dns_support                   = true
      [32m+[0m[0m enable_network_address_usage_metrics = (known after apply)
      [32m+[0m[0m id                                   = (known after apply)
      [32m+[0m[0m instance_tenancy                     = "default"
      [32m+[0m[0m ipv6_association_id                  = (known after apply)
      [32m+[0m[0m ipv6_cidr_block                      = (known after apply)
      [32m+[0m[0m ipv6_cidr_block_network_border_group = (known after apply)
      [32m+[0m[0m main_route_table_id                  = (known after apply)
      [32m+[0m[0m owner_id                             = (known after apply)
      [32m+[0m[0m tags                                 = {
          [32m+[0m[0m "Name" = "vpc-1708218440"
        }
      [32m+[0m[0m tags_all                             = {
          [32m+[0m[0m "Name" = "vpc-1708218440"
        }
    }

[1mPlan:[0m 24 to add, 0 to change, 0 to destroy.
[0m
Changes to Outputs:
  [32m+[0m[0m demo_cluster_role_arn = (known after apply)
  [32m+[0m[0m node_role_arn         = (known after apply)
  [32m+[0m[0m private_subnet_ids    = [
      [32m+[0m[0m (known after apply),
      [32m+[0m[0m (known after apply),
    ]
  [32m+[0m[0m public_subnet_ids     = [
      [32m+[0m[0m (known after apply),
      [32m+[0m[0m (known after apply),
    ]
  [32m+[0m[0m subnet_ids            = [
      [32m+[0m[0m (known after apply),
      [32m+[0m[0m (known after apply),
    ]
[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
