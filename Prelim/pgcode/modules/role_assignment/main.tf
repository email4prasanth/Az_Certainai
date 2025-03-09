resource "azurerm_role_assignment" "role_assignment" {
  for_each = toset(flatten([for role in var.role_definition_name : role]))
  principal_id        = var.principal_id
  role_definition_name = each.value
  scope                = var.scope
}
