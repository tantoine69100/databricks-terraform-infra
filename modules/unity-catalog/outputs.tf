output "metastore_id" {
  description = "ID du metastore Unity Catalog"
  value       = databricks_metastore.this.id
}

output "catalog_name" {
  description = "Nom du catalog Unity Catalog"
  value       = databricks_catalog.this.name
}

output "schema_bronze" {
  description = "Nom complet du schema bronze"
  value       = "${databricks_catalog.this.name}.${databricks_schema.bronze.name}"
}

output "schema_silver" {
  description = "Nom complet du schema silver"
  value       = "${databricks_catalog.this.name}.${databricks_schema.silver.name}"
}

output "schema_gold" {
  description = "Nom complet du schema gold"
  value       = "${databricks_catalog.this.name}.${databricks_schema.gold.name}"
}
