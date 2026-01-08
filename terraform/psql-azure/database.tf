resource "random_password" "pg_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()_+-=[]{}:?"
}

resource "azurerm_postgresql_flexible_server" "pg_server" {
  # CORRIGIDO: Nome exato que está na sua connection string
  name = "psql-oficina-fsmt-soat-12"

  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  version = "14" # Confirme se criou como versão 14 ou 16

  # CORRIGIDO: Usuário exato da connection string
  administrator_login    = "postgres_admin"
  administrator_password = random_password.pg_password.result

  # Ajuste o SKU se o seu manual for diferente (ex: B_Standard_B1ms é o mais barato)
  sku_name   = "B_Standard_B1ms"
  storage_mb = 32768

  # IMPORTANTE: Se você acessa de fora da Azure, isso deve ser true
  public_network_access_enabled = true

  tags = {
    Environment = "Development"
    Project     = "SOAT12-FSMT"
  }
}

# Este bloco cria um banco DENTRO do servidor. 
# A connection string usa 'postgres' (padrão), mas é ideal ter um para a app.
resource "azurerm_postgresql_flexible_server_database" "pg_db" {
  name      = "oficina_db" # Sugiro não usar 'meu_banco...', use um nome real
  server_id = azurerm_postgresql_flexible_server.pg_server.id
  charset   = "UTF8"
  collation = "en_US.UTF-8"
}