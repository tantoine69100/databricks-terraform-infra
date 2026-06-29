# Storage Credential — permet à Unity Catalog d'accéder à l'ADLS Gen2 de l'environnement
# via l'Access Connector (Managed Identity) propre à chaque env
resource "databricks_storage_credential" "adls" {
  name = "cred-adls-${var.environnement}"

  azure_managed_identity {
    access_connector_id = var.access_connector_id
  }

  comment = "Storage credential pour ADLS Gen2 ${var.environnement} via Access Connector"
}

# External Location — déclare le container ADLS Gen2 de l'environnement dans Unity Catalog
# Point d'entrée pour que les tables Delta puissent stocker leurs données
resource "databricks_external_location" "adls" {
  name            = "ext-loc-${var.environnement}"
  url             = "abfss://${var.container_name}@${var.storage_account_name}.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.adls.name
  comment         = "External location pour l'environnement ${var.environnement}"
}
