resource "azurerm_virtual_network" "VNet" {
  name                = var.Vnet_name
  location            = var.Loca_name
  resource_group_name = var.RG_name  # (OR) resource_group_name = module.resource_group.rg_name
  address_space       = var.Address_space
  tags = var.Tags
}

# Create multiple subnets
resource "azurerm_subnet" "subnets" {
  for_each             = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = var.RG_name
  virtual_network_name = azurerm_virtual_network.VNet.name
  address_prefixes     = [each.value.address_prefix]
}