terraform {
  required_version = ">= 1.5.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id = var.arm_subscription_id
}

provider "databricks" {
  host                = var.databricks_host
  azure_client_id     = var.arm_client_id
  azure_client_secret = var.arm_client_secret
  azure_tenant_id     = var.arm_tenant_id
  account_id          = var.databricks_account_id
}
