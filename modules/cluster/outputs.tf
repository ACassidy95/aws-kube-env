output "cluster_id" {
  description = "ID of the created cluster"
  value       = aws_eks_cluster.this.id
}
