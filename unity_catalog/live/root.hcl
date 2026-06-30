remote_state {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstate06081999"
    container_name       = "tfstate-databricks"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  arm_client_id       = get_env("ARM_CLIENT_ID")
  arm_client_secret   = get_env("ARM_CLIENT_SECRET")
  arm_tenant_id       = get_env("ARM_TENANT_ID")
  arm_subscription_id = get_env("ARM_SUBSCRIPTION_ID")
  databricks_account_id = "a442a39e-1cde-4561-908e-03d0a4879f9a"
}