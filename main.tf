module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "virtual_network" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.rg_name_output
  location            = module.resource_group.location_output
  address_space       = var.address_space
  depends_on = [ module.resource_group ]
}
