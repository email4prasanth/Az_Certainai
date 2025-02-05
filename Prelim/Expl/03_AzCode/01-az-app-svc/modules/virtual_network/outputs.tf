output "vnet_id" {
  value = azurerm_virtual_network.VNet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.VNet.name
}

# # Single subnets
# output "subnet_id" {
#   value = azurerm_subnet.subnet1.id
# }

# Multiple subnets
output "subnet_ids" {
  description = "List of Subnet IDs"
  value = [for subnet in azurerm_subnet.subnets : subnet.id]
}
