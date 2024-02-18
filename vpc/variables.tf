variable "private_cidr" {
  # List of CIDR blocks for private subnets.
  type    = list(string)
  default = ["10.0.0.0/19", "10.0.32.0/19"]
}

variable "availability_zones" {
  # List of Availability Zones used for subnet placement.
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_cidr" {
  # List of CIDR blocks for public subnets.
  type    = list(string)
  default = ["10.0.64.0/19", "10.0.96.0/19"]
}



