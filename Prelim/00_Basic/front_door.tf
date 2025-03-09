# # Create Azure Front Door Profile
# resource "azurerm_frontdoor" "front_door" {
#   name                = "${var.project_name}-${var.environment}-frontdoor"
#   resource_group_name = azurerm_resource_group.platform20_assist_resource_group.name

#   frontend_endpoint {
#     name      = "${var.project_name}-${var.environment}-frontend-endpoint"
#     host_name = "${var.project_name}-${var.environment}-frontdoor.azurefd.net"
#   }

#   backend_pool {
#     name = "${var.project_name}-${var.environment}-backend-pool"
#     backend {
#       host_header = "example.com"
#       address     = "example.com"
#       http_port   = 80
#       https_port  = 443
#     }
#     load_balancing_name = "${var.project_name}-${var.environment}-load-balancing"
#     health_probe_name   = "${var.project_name}-${var.environment}-health-probe"
#   }

#   routing_rule {
#     name               = "${var.project_name}-${var.environment}-routing-rule"
#     accepted_protocols = ["Http", "Https"]
#     patterns_to_match  = ["/*"]
#     frontend_endpoints = ["${var.project_name}-${var.environment}-frontend-endpoint"]
#     forwarding_configuration {
#       forwarding_protocol = "MatchRequest"
#       backend_pool_name   = "${var.project_name}-${var.environment}-backend-pool"
#     }
#   }

#   backend_pool_load_balancing {
#     name = "${var.project_name}-${var.environment}-load-balancing"
#   }

#   backend_pool_health_probe {
#     name = "${var.project_name}-${var.environment}-health-probe"
#     protocol = "Http"
#     interval_in_seconds = 30
#   }

#   tags = var.tags
# }

# output "frontdoor_name" {
#   description = "The name of the Azure Front Door profile."
#   value       = azurerm_frontdoor.front_door.name
# }

# output "frontdoor_endpoint" {
#   description = "The frontend endpoint of the Azure Front Door profile."
#   value       = azurerm_frontdoor.front_door.frontend_endpoint[0].host_name
# }

# output "backend_pool_name" {
#   description = "The name of the backend pool."
#   value       = azurerm_frontdoor.front_door.backend_pool[0].name
# }

# output "routing_rule_name" {
#   description = "The name of the routing rule."
#   value       = azurerm_frontdoor.front_door.routing_rule[0].name
# }

# output "health_probe_name" {
#   description = "The name of the health probe."
#   value       = azurerm_frontdoor.front_door.backend_pool_health_probe[0].name
# }

# output "load_balancing_name" {
#   description = "The name of the load balancing configuration."
#   value       = azurerm_frontdoor.front_door.backend_pool_load_balancing[0].name
# }
