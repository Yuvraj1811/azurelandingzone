output "subnet_name" {
  value = [for s in azurerm_subnet.subnet : s.name]
}

output "subnet_id" {
  value = [for s in azurerm_subnet.subnet : s.id]
}


