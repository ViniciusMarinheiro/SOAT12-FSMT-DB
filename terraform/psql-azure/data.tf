variable "resource_group_name" {
  description = "Nome do Resource Group onde o banco de dados está localizado"
  type        = string
  # ATENÇÃO: Troque "MyResourceGroup" pelo nome do RG onde você criou o banco manualmente
  default     = "rg-fsmt-soat12" 
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}