# Catalog Unity Catalog partagé entre tous les environnements
resource "databricks_catalog" "this" {
  name    = var.catalog_name
  comment = "Catalog principal géré par Terraform"

  properties = {
    gere_par = "terraform"
  }

  depends_on = [databricks_metastore_assignment.this]
}
