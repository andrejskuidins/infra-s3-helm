terraform {
  required_version = "~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30.0"
    }
  }
  backend "s3" {
    region  = "eu-central-1"
    encrypt = "true"
  }
}

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = var.tags
  }
}
