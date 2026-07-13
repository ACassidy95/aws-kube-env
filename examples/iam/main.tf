module "developer_role" {
  source                    = "../../modules/iam"
  base_name                 = var.base_name
  cluster_name              = var.cluster_name
  viewer_kubernetes_groups  = var.viewer_kubernetes_groups
  manager_kubernetes_groups = var.manager_kubernetes_groups
}