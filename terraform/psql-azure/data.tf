variable "resource_group_name" {
  description = "Name of the existing resource group created by the AKS repo"
  type        = string
  default     = "MyResourceGroup" 
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}