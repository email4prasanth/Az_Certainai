# // Create the azure blob storage
# resource "azurerm_storage_account" "blob_storage" {
#   name                     = "${terraform.workspace}entassistsge"
#   resource_group_name      = azurerm_resource_group.enterprise_assist_resource_group.name
#   location                 = azurerm_resource_group.enterprise_assist_resource_group.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   identity {
#     type = "SystemAssigned"
#   }
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }

# // Role assignment for VM to access the blob storage
# resource "azurerm_role_assignment" "storage_account_access_vm" {
#   scope        = azurerm_storage_account.blob_storage.id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id = azurerm_linux_virtual_machine.virtual_machine.identity[0].principal_id
#   depends_on = [
#     azurerm_storage_account.blob_storage,
#     azurerm_linux_virtual_machine.virtual_machine
#   ]
# }
