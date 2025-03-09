resource "azurerm_public_ip" "public_ip" {
  name                = "${var.project_name}-${var.environment}-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.platform20_assist_resource_group.name
  allocation_method   = "Static"
  tags                = var.tags
}

resource "azurerm_network_interface" "NIC" {
  name                = "${var.project_name}-${var.environment}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.platform20_assist_resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.NIC.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

output "nic_id" {
  value = azurerm_network_interface.NIC.id
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}