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

variable "environnement" {
  description = "Nom de l'environnement (dev, staging, prod)"
  type        = string
}

variable "repo_url" {
  description = "URL du repo GitHub à monter comme git folder"
  type        = string
}

variable "git_username" {
  description = "Nom d'utilisateur GitHub"
  type        = string
}

variable "git_personal_access_token" {
  description = "Personal Access Token GitHub (injecté via secret GitHub Actions GITHUB_PAT)"
  type        = string
  sensitive   = true
}
