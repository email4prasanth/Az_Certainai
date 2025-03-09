output "nic_id" {
  value = azurerm_network_interface.NIC.id
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}
