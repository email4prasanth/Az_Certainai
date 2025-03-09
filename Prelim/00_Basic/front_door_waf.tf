# # Create Web Application Firewall (WAF) Policy
# resource "azurerm_frontdoor_firewall_policy" "waf_policy" {
#   name                = "${var.project_name}-${var.environment}-waf-policy"
#   resource_group_name = azurerm_resource_group.platform20_assist_resource_group.name

#   enabled = true

#   # Custom Rules
#   custom_rule {
#     name                           = "CustomRule1"
#     action                         = "Block"
#     priority                       = 1
#     rate_limit_duration_in_minutes = 1
#     rate_limit_threshold           = 10
#     type                           = "MatchRule"

#     match_condition {
#       match_variable = "RemoteAddr"
#       operator       = "IPMatch"
#       match_values   = ["192.168.1.0/24"]
#     }
#   }

#   # Managed Rules
#   managed_rule {
#     type    = "DefaultRuleSet"
#     version = "1.0"

#     # Override the default action for specific rule groups or rules
#     override {
#       rule_group_name = "SQLI"

#       rule {
#         rule_id = "942100"
#         action  = "Block"
#       }

#       rule {
#         rule_id = "942110"
#         action  = "Block"
#       }
#     }

#     override {
#       rule_group_name = "XSS"

#       rule {
#         rule_id = "941100"
#         action  = "Block"
#       }

#       rule {
#         rule_id = "941110"
#         action  = "Block"
#       }
#     }
#   }

#   tags = var.tags
# }

# # Associate WAF Policy with Front Door
# resource "azurerm_frontdoor_firewall_policy_association" "waf_association" {
#   frontdoor_id       = azurerm_frontdoor.front_door.id
#   firewall_policy_id = azurerm_frontdoor_firewall_policy.waf_policy.id
# }

# output "waf_policy_name" {
#   description = "The name of the Web Application Firewall (WAF) policy."
#   value       = azurerm_frontdoor_firewall_policy.waf_policy.name
# }

# output "waf_policy_id" {
#   description = "The ID of the Web Application Firewall (WAF) policy."
#   value       = azurerm_frontdoor_firewall_policy.waf_policy.id
# }

# output "waf_association_id" {
#   description = "The ID of the WAF policy association with the Front Door."
#   value       = azurerm_frontdoor_firewall_policy_association.waf_association.id
# }

# output "waf_custom_rules" {
#   description = "List of custom rules in the WAF policy."
#   value       = azurerm_frontdoor_firewall_policy.waf_policy.custom_rule[*].name
# }

# output "waf_managed_rules" {
#   description = "List of managed rule types and versions in the WAF policy."
#   value       = azurerm_frontdoor_firewall_policy.waf_policy.managed_rule[*].type
# }