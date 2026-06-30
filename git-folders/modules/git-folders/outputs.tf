output "repo_path" {
  description = "Chemin du git folder dans le workspace Databricks"
  value       = databricks_repo.this.path
}

output "repo_url" {
  description = "URL du repo GitHub monté"
  value       = databricks_repo.this.url
}

output "service_principal_id" {
  description = "ID du Service Principal Databricks dédié aux git folders"
  value       = databricks_service_principal.git_folders.id
}
