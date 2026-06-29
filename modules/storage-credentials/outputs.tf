output "storage_credential_name" {
  description = "Nom du storage credential"
  value       = databricks_storage_credential.adls.name
}

output "external_location_url" {
  description = "URL de l'external location ADLS Gen2"
  value       = databricks_external_location.adls.url
}

output "external_location_name" {
  description = "Nom de l'external location"
  value       = databricks_external_location.adls.name
}
