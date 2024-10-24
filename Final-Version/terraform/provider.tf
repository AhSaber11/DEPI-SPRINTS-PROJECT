terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.64.0"  # Specify the version you're using
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Specify your AWS region
}

