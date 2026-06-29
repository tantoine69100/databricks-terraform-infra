variable "databricks_host" {
  description = "URL du workspace Databricks principal"
  type        = string
}

variable "arm_client_id" {
  description = "Client ID du Service Principal Azure"
  type        = string
  sensitive   = true
}

variable "arm_client_secret" {
  description = "Client Secret du Service Principal Azure"
  type        = string
  sensitive   = true
}

variable "arm_tenant_id" {
  description = "Tenant ID Azure"
  type        = string
  sensitive   = true
}

variable "arm_subscription_id" {
  description = "Subscription ID Azure"
  type        = string
}

variable "workspace_ids" {
  description = "Liste des IDs des 3 workspaces à attacher au metastore"
  type        = list(number)
}

variable "metastore_storage_account_name" {
  description = "Nom du storage account dédié au metastore (output de common-env-resources)"
  type        = string
}

variable "metastore_container_name" {
  description = "Nom du container metastore (output de common-env-resources)"
  type        = string
}

variable "catalog_name" {
  description = "Nom du catalog Unity Catalog partagé"
  type        = string
}

variable "databricks_account_id" {
  description = "ID du compte Databricks (visible sur accounts.azuredatabricks.net)"
  type        = string
}
