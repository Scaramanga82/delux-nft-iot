variable "env" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "key_name" {
  description = "Private key ec2"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of private subnet"
  type        = string
}
