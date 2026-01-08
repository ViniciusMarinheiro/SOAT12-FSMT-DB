resource "random_password" "pg_password" {
  length  = 16
  special = true
  override_special = "!#$%&*()_+-=[]{}:?"
}

resource "azurerm_postgresql_flexible_server" "pg_server" {
  name = "soat12-fsmt-db-server" 
  
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  
  version             = "14" 
  administrator_login    = "pgadmin"
  administrator_password = random_password.pg_password.result
  sku_name = "B_Standard_B1ms" 
  storage_mb = 32768
  public_network_access_enabled = false 

  tags = {
    Environment = "Development"
    Project     = "SOAT12-FSMT"
  }
}

resource "azurerm_postgresql_flexible_server_database" "pg_db" {
  name      = "meu_banco_de_dados"
  server_id = azurerm_postgresql_flexible_server.pg_server.id
  charset   = "UTF8"
  collation = "en_US.UTF-8"
}