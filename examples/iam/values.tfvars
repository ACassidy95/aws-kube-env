base_name    = "aaron-test"
region       = "eu-west-1"
cluster_name = "aaron-test-cluster"
viewer_kubernetes_groups = [
  "viewer-group", # from ./resources/cluster-role-binding.yaml
]
manager_kubernetes_groups = [
  "admin-group", # from ./resources/cluster-role-binding.yaml
]