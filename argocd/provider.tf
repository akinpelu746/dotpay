terraform {
  required_version = ">= 0.14.0"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
 aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"


    }
  }
}