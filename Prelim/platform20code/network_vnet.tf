resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}-${var.environment}-vnet"
  address_space       = [var.vnet_cidr]
  location            = azurerm_resource_group.platform20_assist_resource_group.location
  resource_group_name = azurerm_resource_group.platform20_assist_resource_group.name
  tags                = var.tags
}



output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}


