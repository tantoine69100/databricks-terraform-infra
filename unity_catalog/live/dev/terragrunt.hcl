include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../modules/storage-credentials"
}

inputs = {
  databricks_host      = "https://adb-7405610369572793.13.azuredatabricks.net"
  environnement        = "dev"
  access_connector_id  = "/subscriptions/4953ac54-369e-4321-ad5b-e4707c62695b/resourceGroups/rg-databricks-dev/providers/Microsoft.Databricks/accessConnectors/dac-dev"
  storage_account_name = "dbstoragevelovdev"
  container_name       = "medailloncontainer"
}

dependency "shared" {
  config_path = "../shared"
}
