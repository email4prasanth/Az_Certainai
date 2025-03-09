# # Create Content Delivery Network (CDN) Profile
# resource "azurerm_cdn_profile" "cdn_profile" {
#   name                = "${var.project_name}-${var.environment}-cdn-profile"
#   location            = azurerm_resource_group.platform20_assist_resource_group.location
#   resource_group_name = azurerm_resource_group.platform20_assist_resource_group.name
#   sku                 = "Standard_Microsoft"

#   tags = var.tags
# }

# # Create CDN Endpoint
# resource "azurerm_cdn_endpoint" "cdn_endpoint" {
#   name                = "${var.project_name}-${var.environment}-cdn-endpoint"
#   profile_name        = azurerm_cdn_profile.cdn_profile.name
#   location            = azurerm_resource_group.platform20_assist_resource_group.location
#   resource_group_name = azurerm_resource_group.platform20_assist_resource_group.name

#   origin {
#     name      = "example"
#     host_name = "example.com"
#   }

#   tags = var.tags
# }

# output "cdn_profile_name" {
#   description = "The name of the Azure CDN profile."
#   value       = azurerm_cdn_profile.cdn_profile.name
# }

# output "cdn_profile_id" {
#   description = "The ID of the Azure CDN profile."
#   value       = azurerm_cdn_profile.cdn_profile.id
# }

# output "cdn_endpoint_name" {
#   description = "The name of the Azure CDN endpoint."
#   value       = azurerm_cdn_endpoint.cdn_endpoint.name
# }

# output "cdn_endpoint_id" {
#   description = "The ID of the Azure CDN endpoint."
#   value       = azurerm_cdn_endpoint.cdn_endpoint.id
# }

# output "cdn_endpoint_hostname" {
#   description = "The hostname of the Azure CDN endpoint."
#   value       = azurerm_cdn_endpoint.cdn_endpoint.host_name
# }

# output "cdn_origin_hostname" {
#   description = "The hostname of the origin for the Azure CDN endpoint."
#   value       = azurerm_cdn_endpoint.cdn_endpoint.origin[0].host_name
# }