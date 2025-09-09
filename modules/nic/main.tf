resource "azurerm_network_interface" "nic" {
  for_each            = var.nic_map
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
