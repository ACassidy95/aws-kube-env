output "role_name" {
  description = "Name of created role"
  value       = aws_iam_user.this.name
}