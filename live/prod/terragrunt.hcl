include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../modules/storage-credentials"
}

inputs = {
  arm_client_id       = get_env("ARM_CLIENT_ID")
  arm_client_secret   = get_env("ARM_CLIENT_SECRET")
  arm_tenant_id       = get_env("ARM_TENANT_ID")
  arm_subscription_id = get_env("ARM_SUBSCRIPTION_ID")

  databricks_host      = "https://adb-7405615842563673.13.azuredatabricks.net"
  environnement        = "prod"
  access_connector_id  = "/subscriptions/4953ac54-369e-4321-ad5b-e4707c62695b/resourceGroups/rg-databricks-prod/providers/Microsoft.Databricks/accessConnectors/dac-prod"
  storage_account_name = "databricksstoragevelovprod"
  container_name       = "medailloncontainer"
}
