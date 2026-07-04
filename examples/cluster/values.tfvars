base_name       = "aaron-test"
region          = "eu-west-1"
cluster_version = "1.35"
// Use subnet ids supplied from suitable networking infra source
subnet_ids = [
  "0.0.0.0/0",
  "127.0.0.1/31",
]