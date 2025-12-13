output "DB_HOST" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "DB_PORT" {
  value = "5432"
}

output "DB_DATABASE" {
  # Correção: mudado de 'default_db' para 'oficina_db'
  value = azurerm_postgresql_flexible_server_database.oficina_db.name
}

output "DB_USERNAME" {
  value = var.db_username
}

output "DB_PASSWORD" {
  value     = var.db_password
  sensitive = true
}

output "CONNECTION_STRING_EXAMPLE" {
  # Correção: mudado de 'default_db' para 'oficina_db'
  value = "host=${azurerm_postgresql_flexible_server.postgres.fqdn} user=${var.db_username} password=... dbname=${azurerm_postgresql_flexible_server_database.oficina_db.name} port=5432 sslmode=require"
}
