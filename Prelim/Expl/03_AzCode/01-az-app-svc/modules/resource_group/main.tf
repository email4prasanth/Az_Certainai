# Create a resource group
resource "azurerm_resource_group" "RG" {
  name     = var.RG_name
  location = var.Loca_name
}