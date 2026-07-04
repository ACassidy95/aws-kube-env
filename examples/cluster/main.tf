module "eks-cluster" {
  source          = "../../modules/cluster"
  base_name       = var.base_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
}