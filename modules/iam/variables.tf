variable "base_name" {
  type        = string
  default     = ""
  description = "Base name for resources in module"
}

variable "cluster_name" {
  type        = string
  default     = ""
  description = "Name of cluster IAM resources are being created for"
}

variable "kubernetes_groups" {
  type        = list(string)
  default     = []
  description = "List of defined Kubernetes ClusterRoleBinding accessGroup names for IAM resources to have access to"
}