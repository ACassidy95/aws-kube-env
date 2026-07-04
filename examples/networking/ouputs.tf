output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.cluster-networking.vpc_id
}

output "public_subnet_ids" {
  description = "List of IDs of the public subnets created within the VPC"
  value       = module.cluster-networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of IDs of the private subnets created within the VPC"
  value       = module.cluster-networking.private_subnet_ids
}