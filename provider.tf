terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfbackend"
    storage_account_name = "tfbackendstrg"
    container_name       = "tfcontainer"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = data.azurerm_key_vault_secret.subscription_id.value
  client_id       = data.azurerm_key_vault_secret.client_id.value
  client_secret   = data.azurerm_key_vault_secret.client_secret.value
  tenant_id       = data.azurerm_key_vault_secret.tenant_id.value

}

data "azurem_key_vault" "kv" {
  name                = "keyvaultcredential01"
  resource_group_name = "rg-keyvault"
}

data "azurerm_key_vault_secret" "client_id" {
  name         = "client-id"
  key_vault_id = data.azurem_key_vault.kv.id
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = "client-secret"
  key_vault_id = data.azurem_key_vault.kv.id
}

data "azurerm_key_vault_secret" "subscription_id" {
  name         = "subscription-id"
  key_vault_id = data.azurem_key_vault.kv.id
}

data "azurerm_key_vault_secret" "tenant_id" {
  name         = "tenant-id"
  key_vault_id = data.azurem_key_vault.kv.id
}

