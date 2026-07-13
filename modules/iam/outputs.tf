output "user_name" {
  description = "Name of created IAM user"
  value       = aws_iam_user.viewer.name
}

output "role_name" {
  description = "Name of created IAM role"
  value       = aws_iam_role.admin.name
}