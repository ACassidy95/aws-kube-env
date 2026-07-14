terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket       = "aaronc-dev-state-backend"
    key          = "state/kube-env/examples/base-charts/terraform.tf"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}