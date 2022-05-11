# Configure the Terraform provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Configure S3 Module
module "bucket" {
  source = "./s3"
  name   = "global-artifacts"
}
