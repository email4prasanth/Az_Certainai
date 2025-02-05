resource "azurerm_virtual_network" "VNet" {
  name                = var.Vnet_name
  location            = var.Loca_name
  resource_group_name = var.RG_name  # (OR) resource_group_name = module.resource_group.rg_name
  address_space       = var.address_space
  tags = var.tags
}
