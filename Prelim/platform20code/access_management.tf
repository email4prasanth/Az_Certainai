# module "azuread_groups" {
#   for_each     = var.ad_groups[terraform.workspace]
#   source       = "./modules/ad_groups"
#   display_name = each.value
# }

# # Assign roles to Azure AD groups
# module "role_assignment" {
#   for_each             = var.role_assignments[terraform.workspace]
#   source               = "./modules/role_assignment"
#   principal_id         = module.azuread_groups[each.key].object_id
#   role_definition_name = flatten([for role in each.value["role"] : role])
#   scope                = azurerm_resource_group.platform20_assist_resource_group.id
# }