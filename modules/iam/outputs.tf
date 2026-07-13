output "user_name" {
  description = "Name of created IAM user"
  value       = aws_iam_user.viewer.name
}