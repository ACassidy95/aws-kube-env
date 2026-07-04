variable "base_name" {
  type        = string
  default     = ""
  description = "Base name for resources in module"
}

variable "cluster_version" {
  type        = string
  default     = "1.35"
  description = "Kubernetes version"
}

variable "subnet_ids" {
  type        = list(string)
  default     = ""
  description = "IDs of the private subnets to deploy cluster instances into"
}