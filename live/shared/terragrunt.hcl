include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../modules/unity-catalog"
}

inputs = {
  arm_client_id       = get_env("ARM_CLIENT_ID")
  arm_client_secret   = get_env("ARM_CLIENT_SECRET")
  arm_tenant_id       = get_env("ARM_TENANT_ID")
  arm_subscription_id = get_env("ARM_SUBSCRIPTION_ID")

  databricks_host = "https://adb-7405610369572793.13.azuredatabricks.net"

  workspace_ids = [
    "7405610369572793",       # dev
    "<staging-workspace-id>",
    "<prod-workspace-id>"
  ]

  metastore_storage_account_name = "stmetastorevelov"
  metastore_container_name       = "metastore"

  catalog_name = "velov"
}
