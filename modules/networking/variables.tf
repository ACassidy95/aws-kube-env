variable "base_name" {
  type        = string
  default     = ""
  description = "Base name for resources in module"
}

variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "Region to deploy resources into"
}

variable "vpc_cidr_range" {
  type        = string
  default     = "10.0.0.0/26" // Give space for 64 IPs by default
  description = "Range of private IP allocatable within the VPC"
}

variable "subnet_config_public" {
  type = map(string)
  default = { // Give 24 of the default 64
    "eu-west-1a" = "10.0.0.0/29"
    "eu-west-1b" = "10.0.0.8/29"
    "eu-west-1c" = "10.0.0.16/29"
  }
  description = "Maps availability zones to public subnet CIDRs"
}

variable "subnet_config_private" {
  type = map(string)
  default = { // Give 24 of the default 64
    "eu-west-1a" = "10.0.0.24/29"
    "eu-west-1b" = "10.0.0.32/29"
    "eu-west-1c" = "10.0.0.40/29"
  }
  description = "Maps availability zones to private subnet CIDRs"
}

variable "nat_zone" {
  type        = string
  default     = "eu-west-1a"
  description = "Availability zone to deploy NAT Gateway into"
}
