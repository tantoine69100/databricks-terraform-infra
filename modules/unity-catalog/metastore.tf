# Création du metastore Unity Catalog
# Ressource au niveau du compte Databricks, partagée entre tous les workspaces
# Le storage_root pointe vers le storage account dédié créé dans common-env-resources
resource "databricks_metastore" "this" {
  name          = "metastore_azure_francecentral"
  storage_root  = "abfss://${var.metastore_container_name}@${var.metastore_storage_account_name}.dfs.core.windows.net/"
  region        = "francecentral"
  force_destroy = true
}

# Assignation du metastore aux 3 workspaces (dev, staging, prod) en une seule fois
resource "databricks_metastore_assignment" "this" {
  for_each     = toset([for id in var.workspace_ids : tostring(id)])
  metastore_id = databricks_metastore.this.id
  workspace_id = each.value
}