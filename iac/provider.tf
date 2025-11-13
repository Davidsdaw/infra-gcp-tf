terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
  default_tags {
    tags = {
      Owner       = var.owner
      Project     = var.project
      Environment = var.environment_tag
      ExpiryDate  = var.expiry_date
      ManagedBy   = var.managed_by
    }
  }
}
