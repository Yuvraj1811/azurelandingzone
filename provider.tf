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

variables "client_id"{}
variables "client_secret"{}
variables "subscription_id"{}
variables "tenant_id"{}


provider "azurerm" {
  features{}
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  
}

