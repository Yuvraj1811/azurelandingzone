terraform {
     backend "azurerm" {
    resource_group_name  = "rg-tfbackend"
    storage_account_name = "tfbackendstrg"
    container_name       = "tfcontainer"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }
}

provider "azurerm" {
  features{}
  
}