resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = var.postgres_name
  resource_group_name = var.RG_name
  location            = var.Loca_name

# The cheapest SKU is B_Standard_B1ms compare to GP_Standard_D2ds_v4
#   sku_name            = "GP_Standard_D2ds_v4"  # ✅ Supports 10GB storage
#   storage_mb          = max(var.storage_mb, 10240)  # ✅ Minimum 10GB allowed
  sku_name            = "B_Standard_B1ms"  # Optimized SKU
  storage_mb          = max(var.storage_mb, 32768)  # Minimum 32GB

  administrator_login          = var.admin_username
  administrator_password       = var.admin_password
  version                      = "15"
#   delegated_subnet_id          = var.subnet_id    # To avoid VNet attachment
#   private_dns_zone_id          = var.private_dns_zone_id
#   public_network_access_enabled = var.public_network_access
# ✅ Enable Public Access (No Private DNS Zone Required)
  public_network_access_enabled = true

  tags = var.Tags
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  count     = var.public_network_access ? 1 : 0
  name      = "AllowAll"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
