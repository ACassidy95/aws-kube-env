output "cluster_name" {
  description = "ID of the created EKS cluster"
  value       = module.eks_cluster.cluster_id
}
