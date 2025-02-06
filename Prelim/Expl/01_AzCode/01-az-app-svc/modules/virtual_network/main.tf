resource "azurerm_virtual_network" "VNet" {
  name                = var.Vnet_name
  location            = var.Loca_name
  resource_group_name = var.RG_name  # (OR) resource_group_name = module.resource_group.rg_name
  address_space       = var.Address_space
  tags = var.Tags
}

# Create a single subnet 
resource "azurerm_subnet" "subnet1" {
  name                 = "dkutti_subnet1"
  resource_group_name  = var.RG_name
  virtual_network_name = azurerm_virtual_network.VNet.name
  address_prefixes     = var.Address_prefixes # ["10.0.2.0/24"]
}
