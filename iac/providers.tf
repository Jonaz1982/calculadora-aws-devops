terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  backend "s3" {
    bucket         = var.s3_bucket
    key            = var.s3_key
    region         = var.region
    encrypt        = true
    dynamodb_table = var.s3_dynamodb_table
  }
}
