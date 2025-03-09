resource "azurerm_subnet" "subnet" {
  name                 = "${var.project_name}-${var.environment}-subnet"
  resource_group_name  = azurerm_resource_group.platform20_assist_resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr]
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

