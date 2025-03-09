resource "azuread_group" "platform20_assist_ad_groups" {
  display_name    = var.display_name
  security_enabled = true
}

output "object_id" {
  value = azuread_group.platform20_assist_ad_groups.object_id
}