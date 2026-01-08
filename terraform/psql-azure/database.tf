resource "random_password" "pg_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()_+-=[]{}:?"
}

resource "azurerm_postgresql_flexible_server" "pg_server" {
  name = "psql-oficina-fsmt-soat-12"

  resource_group_name = data.azurerm_resource_group.rg.name

  # CORREÇÃO: Localização real do seu banco
  location = "westus"

  # CORREÇÃO: Versão real do seu banco
  version = "15"

  administrator_login    = "postgres_admin"
  administrator_password = random_password.pg_password.result

  sku_name   = "B_Standard_B1ms"
  storage_mb = 32768

  public_network_access_enabled = true

  tags = {
    Environment = "Development"
    Project     = "SOAT12-FSMT"
  }
}

resource "azurerm_postgresql_flexible_server_database" "pg_db" {
  name      = "oficina_db"
  server_id = azurerm_postgresql_flexible_server.pg_server.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}