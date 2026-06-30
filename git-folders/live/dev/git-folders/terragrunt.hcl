include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/git-folders"
}

dependency "storage_credentials" {
  config_path = ".."
}

inputs = {
  databricks_host = "https://adb-7405610369572793.13.azuredatabricks.net"
  environnement   = "dev"
  repo_url        = "https://github.com/tantoine69100/velov_ingestion"
  git_username    = "tantoine69100"
}
