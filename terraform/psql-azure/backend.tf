terraform {
  backend "azurerm" {
    # NOME CORRIGIDO: Deve ser o RG onde você criou a Storage Account
    resource_group_name  = "rg-terraform-state-soat12" 
    storage_account_name = "stterraformstatesoat12" 
    container_name       = "tfstate"
    key                  = "soat12-fsmt-db.terraform.tfstate"
  }
}