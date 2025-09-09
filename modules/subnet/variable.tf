variable "vnet_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}


variable "subnets" {
  description = "A map of subnets with their address prefix"
  type        = map(list(string))
}
