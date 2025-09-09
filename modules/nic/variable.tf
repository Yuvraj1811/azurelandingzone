variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "nic_map" {
  description = "A map of nic to create subnet id"
  type = map(object({
    name      = string
    subnet_id = string
  }))

}
