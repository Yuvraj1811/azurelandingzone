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
  depends_on          = [module.resource_group]
}

module "subnets" {
  source              = "./modules/subnet"
  resource_group_name = module.resource_group.rg_name_output
  vnet_name           = module.virtual_network.vnet_name
  subnets             = var.subnets
  depends_on          = [module.virtual_network]
}

module "network_interface" {
  source              = "./modules/nic"
  location            = module.resource_group.location_output
  resource_group_name = module.resource_group.rg_name_output
  nic_map = {
    frontend = {
      name      = "nic-frontend"
      subnet_id = module.subnets.subnet_id[0]
    }

    backend = {
      name      = "nic-backend"
      subnet_id = module.subnets.subnet_id[1]
    }
  }
}
