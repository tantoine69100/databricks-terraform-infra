include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../modules/storage-credentials"
}

inputs = {
  databricks_host      = "https://adb-7405619454210012.12.azuredatabricks.net"
  environnement        = "staging"
  access_connector_id  = "/subscriptions/4953ac54-369e-4321-ad5b-e4707c62695b/resourceGroups/rg-databricks-staging/providers/Microsoft.Databricks/accessConnectors/dac-staging"
  storage_account_name = "databricksstoragevelovstaging"
  container_name       = "medailloncontainer"
}

dependency "shared" {
  config_path = "../shared"
}