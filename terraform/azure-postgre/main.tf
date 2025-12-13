terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Servidor PostgreSQL Flexible
resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.db_server_name
  # Pegamos o nome e a localização do Resource Group importado acima
  resource_group_name    = data.azurerm_resource_group.rg.name
  location               = "westus"
  
  version                = "15"
  administrator_login    = var.db_username
  administrator_password = var.db_password
  
  sku_name   = "B_Standard_B1ms" 
  storage_mb = 32768 

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  public_network_access_enabled = true

  tags = {
    Environment = "Production"
    Project     = "Oficina-SOAT"
  }
}

resource "azurerm_postgresql_flexible_server_database" "oficina_db" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

# Regras de Firewall
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {
  name             = "allow-azure-internal"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name             = "allow-internet"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
