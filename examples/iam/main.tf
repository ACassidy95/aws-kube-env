module "developer_role" {
  source            = "../../modules/iam"
  base_name         = var.base_name
  cluster_name      = var.cluster_name
  kubernetes_groups = var.kubernetes_groups
}