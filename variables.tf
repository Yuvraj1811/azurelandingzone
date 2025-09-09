variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = string
}

variable "subnets" {
  description = "A map of subnets with their address prefix"
  type        = map(list(string))
}

variable "nic_map" {
  description = "A map of NICs to create with subnet IDs"
  type = map(object({
    name      = string
    subnet_id = string
  }))
}
