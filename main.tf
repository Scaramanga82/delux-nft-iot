terraform {
  required_version = ">= 1.14.0"

  backend "s3" {
    bucket       = "kanazir-tf-state"
    key          = "demo-${var.env}/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.23.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
