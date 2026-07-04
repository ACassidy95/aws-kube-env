terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "aaronc-dev-state-backend"
    key          = "state/kube-env/examples/cluster/terraform.tf"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
