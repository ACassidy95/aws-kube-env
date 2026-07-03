module "cluster-networking" {
  source = "../../modules/networking"

  base_name = var.base_name
  region    = var.region
  nat_zone  = var.nat_zone
}