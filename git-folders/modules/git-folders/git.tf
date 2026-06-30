# Service Principal Databricks dédié aux git folders
# Créé directement dans Databricks, pas dans Azure AD
# Isolé du SP Azure pour limiter les permissions en cas de compromission
resource "databricks_service_principal" "git_folders" {
  provider     = databricks.admin
  display_name = "sp-git-folders-${var.environnement}"
}

# Token OBO (On Behalf Of) — généré au nom du SP git folders
# Permet à Terraform d'agir comme le SP pour créer les git credentials
# Les actions suivantes apparaissent dans les logs sous l'identité du SP, pas du compte admin
resource "databricks_obo_token" "git_folders" {
  provider       = databricks.admin
  application_id = databricks_service_principal.git_folders.application_id
  comment        = "Token OBO pour sp-git-folders-${var.environnement}"
  lifetime_seconds = 3600
}

# Git credentials configurés au nom du SP via le token OBO
# Permet au SP d'accéder au repo GitHub privé
resource "databricks_git_credential" "github" {
  provider              = databricks.sp
  git_username          = var.git_username
  git_provider          = "gitHub"
  personal_access_token = var.git_personal_access_token
}

# Git folder — monte le repo GitHub dans le workspace Databricks
# Chemin fixe : /Repos/sp-git-folders/velov_ingestion
# Uniquement le montage — le déploiement reste dans Databricks Asset Bundles
resource "databricks_repo" "this" {
  provider   = databricks.sp
  url        = var.repo_url
  path       = "/Repos/sp-git-folders-${var.environnement}/velov_ingestion"
  depends_on = [databricks_git_credential.github]
}
