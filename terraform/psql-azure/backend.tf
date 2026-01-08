terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-soat12"
    
    # CORREÇÃO AQUI: O nome correto conforme seu print
    storage_account_name = "stterraformstate12soat" 
    
    container_name       = "tfstate" # Certifique-se que criou esse container lá dentro
    key                  = "soat12-fsmt-db.terraform.tfstate"
  }
}