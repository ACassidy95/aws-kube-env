base_name    = "developer"
region       = "eu-west-1"
cluster_name = "aaron-test-cluster"
kubernetes_groups = [
  "viewer-group", # from ./resources/cluster-role-binding.yaml
]