variable "base_name" {
  type        = string
  description = "Base name for resources in module"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  description = "Name of cluster IAM resources are being created for"
}

variable "viewer_kubernetes_groups" {
  type        = list(string)
  description = "List of defined Kubernetes ClusterRoleBinding accessGroup names for viewer IAM resources to have access to"
}

variable "manager_kubernetes_groups" {
  type        = list(string)
  description = "List of defined Kubernetes ClusterRoleBinding accessGroup names for manager IAM resources to have access to"
}