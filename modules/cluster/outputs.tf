output "name" {
  description = "ID of the created cluster"
  value       = aws_eks_cluster.this.id
}
