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
  default     = "10.0.0.0/24" // Give space for 256 IPs by default
  description = "Range of private IP allocatable within the VPC"
}

variable "subnet_config_public" {
  type = map(string)
  default = { // Give 48 of defult 256
    "eu-west-1a" = "10.0.0.0/27"
    "eu-west-1b" = "10.0.0.32/27"
    "eu-west-1c" = "10.0.0.64/27"
  }
  description = "Maps availability zones to public subnet CIDRs"
}

variable "subnet_config_private" {
  type = map(string)
  default = { // Give 48 of default 256 of the default 64
    "eu-west-1a" = "10.0.0.96/27"
    "eu-west-1b" = "10.0.0.128/27"
    "eu-west-1c" = "10.0.0.160/27"
  }
  description = "Maps availability zones to private subnet CIDRs"
}

variable "nat_zone" {
  type        = string
  default     = "eu-west-1a"
  description = "Availability zone to deploy NAT Gateway into"
}
