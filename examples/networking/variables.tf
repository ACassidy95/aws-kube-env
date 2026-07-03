variable "base_name" {
  type        = string
  default     = ""
  description = "Base name for resources in module"
}

variable "region" {
  type        = string
  description = "Region to deploy resources into"
}

variable "nat_zone" {
  type        = string
  description = "Availability zone to deploy NAT Gateway into"
}