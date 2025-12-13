variable "resource_group_name" {
  description = "Nome do Resource Group EXISTENTE (O mesmo do AKS)"
  type        = string
  default     = "rg-fsmt-soat12" 
}

variable "db_server_name" {
  description = "Nome único do servidor PostgreSQL"
  type        = string
  default     = "psql-oficina-fsmt-soat-12"
}

variable "db_username" {
  description = "Usuário admin"
  type        = string
  default     = "postgres_admin"
}

variable "db_password" {
  description = "Senha do banco"
  type        = string
  sensitive   = true
  default     = "postgres"
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
  default     = "oficina_db"
}
