output "mysql_id" {
  value = azurerm_mysql_flexible_server.mysql.id
}

output "mysql_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "mysql_admin" {
  value = azurerm_mysql_flexible_server.mysql.administrator_login
}
