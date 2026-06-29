remote_state {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstate06081999"
    container_name       = "tfstate-databricks"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}
