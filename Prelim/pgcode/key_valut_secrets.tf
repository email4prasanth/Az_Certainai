# // To store DB admin password on key vault secret
# resource "azurerm_key_vault_secret" "db_admin_password" {
#   name         = "db-admin-password"
#   key_vault_id = azurerm_key_vault.key_vault.id
#   value        = azurerm_postgresql_flexible_server.postgres_database_server.administrator_password
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
#   depends_on = [
#     azurerm_key_vault.key_vault,
#     azurerm_postgresql_flexible_server.postgres_database_server
#   ]
# }

# // Store the VM SSH Private key on secrets
# resource "azurerm_key_vault_secret" "ssh_private_key" {
#   name         = "ssh-private-key"
#   key_vault_id = azurerm_key_vault.key_vault.id
#   value        = tls_private_key.ssh_key.private_key_pem
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
#   depends_on = [
#     azurerm_key_vault.key_vault,
#     tls_private_key.ssh_key
#   ]
# }