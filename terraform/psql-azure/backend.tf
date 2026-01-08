terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstatesoat12" 
    container_name       = "tfstate"
    
    key                  = "soat12-fsmt-db.terraform.tfstate"
  }
}