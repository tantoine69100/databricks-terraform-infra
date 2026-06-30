terraform {
  required_version = ">= 1.5.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }

  backend "azurerm" {}
}

# Provider principal — authentifié via SP Azure pour créer le SP Databricks et le token OBO
provider "databricks" {
  alias               = "admin"
  host                = var.databricks_host
  azure_client_id     = var.arm_client_id
  azure_client_secret = var.arm_client_secret
  azure_tenant_id     = var.arm_tenant_id
}

# Provider secondaire — authentifié via token OBO pour créer les git credentials au nom du SP
provider "databricks" {
  alias = "sp"
  host  = var.databricks_host
  token = databricks_obo_token.git_folders.token_value
}
