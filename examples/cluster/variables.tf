variable "base_name" {
  type        = string
  description = "Base name for resources in module"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
}

variable "subnet_ids" {
  type        = list(string)
  description = "IDs of the private subnets to deploy cluster instances into"
}