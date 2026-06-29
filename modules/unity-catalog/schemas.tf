# Schema Bronze — données brutes ingérées sans transformation
resource "databricks_schema" "bronze" {
  catalog_name = databricks_catalog.this.name
  name         = "bronze"
  comment      = "Données brutes ingérées sans transformation"

  properties = {
    gere_par = "terraform"
    couche   = "bronze"
  }
}

# Schema Silver — données nettoyées et transformées depuis bronze
resource "databricks_schema" "silver" {
  catalog_name = databricks_catalog.this.name
  name         = "silver"
  comment      = "Données nettoyées et transformées depuis bronze"

  properties = {
    gere_par = "terraform"
    couche   = "silver"
  }
}

# Schema Gold — données agrégées et prêtes pour la consommation métier
resource "databricks_schema" "gold" {
  catalog_name = databricks_catalog.this.name
  name         = "gold"
  comment      = "Données agrégées prêtes pour la consommation métier"

  properties = {
    gere_par = "terraform"
    couche   = "gold"
  }
}
