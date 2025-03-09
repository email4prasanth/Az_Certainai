# resource "azurerm_resource_group" "enterprise_assist_resource_group" {
#   name     = "enterprise-assist-${terraform.workspace}"
#   location = local.location
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }