variable "cluster_name" {
  type        = string
  description = "Name of cluster to deploy Helm charts into"
}

variable "region" {
  type        = string
  description = "AWS region"
}