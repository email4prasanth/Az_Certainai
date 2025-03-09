# // To get the current tenant data's
# data "azurerm_client_config" "current" {}

# // Create the Azure Key Vault to store the key and secrets
# resource "azurerm_key_vault" "key_vault" {
#   name                       = "${terraform.workspace}-ent-assist-kv"
#   location                   = azurerm_resource_group.enterprise_assist_resource_group.location
#   resource_group_name        = azurerm_resource_group.enterprise_assist_resource_group.name
#   sku_name                   = "standard"
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days = 7
#   purge_protection_enabled   = false
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }

# // Access policy for Azure Key Vault
# resource "azurerm_key_vault_access_policy" "key_vault_policy" {
#   key_vault_id = azurerm_key_vault.key_vault.id
#   tenant_id = data.azurerm_client_config.current.tenant_id
#   object_id = azurerm_linux_virtual_machine.virtual_machine.identity[0].principal_id
#   key_permissions = ["Get", "List", "Decrypt", "Encrypt"]
#   secret_permissions = ["Get", "List"]
#   depends_on = [
#     azurerm_key_vault.key_vault,
#     azurerm_linux_virtual_machine.virtual_machine
#   ]
# }

# // Output for Key Vault URI
# output "key_vault_uri" {
#   value = azurerm_key_vault.key_vault.vault_uri
# }