resource "azurerm_resource_group" "platform20_assist_resource_group" {
  name     = "${var.project_name}-${terraform.workspace}-rg"
  location = var.location
  tags     = var.tags
}

output "resource_group_name" {
  value = azurerm_resource_group.platform20_assist_resource_group.name
}

output "resource_group_location" {
  value = azurerm_resource_group.platform20_assist_resource_group.location
}