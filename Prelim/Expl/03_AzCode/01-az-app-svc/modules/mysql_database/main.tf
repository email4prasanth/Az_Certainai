resource "azurerm_mysql_flexible_server" "mysql" {
  name                = var.mysql_name
  location            = var.Loca_name
  resource_group_name = var.RG_name
  administrator_login = var.admin_username
  administrator_password = var.admin_password
  sku_name            = var.sku_name
  storage {
    size_gb = var.storage_size_gb
  }
  # high_availability {
  #   mode = var.ha_mode
  # }
  tags = var.Tags
}

resource "azurerm_mysql_flexible_server_firewall_rule" "allow_access" {
  count               = length(var.allowed_ips)
  name                = "allow-${count.index}"
  resource_group_name = var.RG_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  start_ip_address    = var.allowed_ips[count.index]
  end_ip_address      = var.allowed_ips[count.index]
}
