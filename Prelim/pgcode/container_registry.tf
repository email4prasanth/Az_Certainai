# // Create Azure Container Registry to store the docker images
# resource "azurerm_container_registry" "container_registry" {
#   name                = "${terraform.workspace}EntAssistAcr"
#   resource_group_name = azurerm_resource_group.enterprise_assist_resource_group.name
#   location            = azurerm_resource_group.enterprise_assist_resource_group.location
#   sku                 = "Basic"
#   admin_enabled       = false
#   identity {
#     type = "SystemAssigned"
#   }
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }