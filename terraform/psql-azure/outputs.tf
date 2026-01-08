output "db_admin_password" {
  value     = random_password.pg_password.result
  sensitive = true
}

output "db_host" {
  value = azurerm_postgresql_flexible_server.pg_server.fqdn
  description = "O FQDN (Host) do servidor PostgreSQL."
}

output "db_name" {
  value = azurerm_postgresql_flexible_server_database.pg_db.name
  description = "O nome do banco de dados criado."
}