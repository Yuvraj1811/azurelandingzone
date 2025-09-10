resource "azurerm_storage_account" "strg" {
  name                     = var.strg_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

 
}