provider "aws" {
  region = "us-east-1"
}
terraform { 
  required_providers { 
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
    }
    utils = {
      source = "cloudposse/utils"
      version = "1.12.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
 
}
