variable "databricks_host" {
  description = "URL du workspace Databricks de l'environnement"
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

variable "environnement" {
  description = "Nom de l'environnement (dev, staging, prod)"
  type        = string
}

variable "access_connector_id" {
  description = "Resource ID de l'Access Connector de l'environnement (output de databricks-platform)"
  type        = string
}

variable "storage_account_name" {
  description = "Nom du storage account ADLS Gen2 de l'environnement (output de databricks-platform)"
  type        = string
}

variable "container_name" {
  description = "Nom du container médaillon de l'environnement (output de databricks-platform)"
  type        = string
}
