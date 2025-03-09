# // Generate Random Password for Database
# resource "random_password" "db_admin_password" {
#   length = 16
#   special = true
#   override_special = "!@#$%^&*()-_=+?"
# }

# // Create Azure Managed Postgres database
# resource "azurerm_postgresql_flexible_server" "postgres_database_server" {
#   name                              = "${terraform.workspace}-ent-assist-psqlserver"
#   location                          = "East US 2"
#   resource_group_name               = azurerm_resource_group.enterprise_assist_resource_group.name
#   version                           = "16"
#   sku_name                          = "B_Standard_B1ms"
#   storage_mb                        = 65536
#   storage_tier                      = "P6"
#   backup_retention_days             = 7
#   geo_redundant_backup_enabled      = false
#   administrator_login               = "adminUser"
#   administrator_password            = random_password.db_admin_password.result
#   authentication {
#     active_directory_auth_enabled   = false
#     password_auth_enabled           = true
#   }
#   depends_on = [random_password.db_admin_password]
# }

# // Create Database on Postgres server
# resource "azurerm_postgresql_flexible_server_database" "postgres_database" {
#   name      = "enterpriseAssist"
#   server_id = azurerm_postgresql_flexible_server.postgres_database_server.id
#   collation = "en_US.utf8"
#   charset   = "UTF8"

#   # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# // Firewall rule for Postgres database
# resource "azurerm_postgresql_flexible_server_firewall_rule" "database_rule" {
#   name = "AllowAll"
#   server_id = azurerm_postgresql_flexible_server.postgres_database_server.id
#   start_ip_address = "0.0.0.0"
#   end_ip_address = "255.255.255.255"
#   depends_on = [azurerm_postgresql_flexible_server.postgres_database_server]
# }