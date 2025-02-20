
resource "azurerm_network_interface" "NIC" {
  name                = var.NIC_name
  location            = var.Loca_name
  resource_group_name = var.RG_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.Subnet_ids[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = var.Tags
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.NIC.id
  network_security_group_id = var.Nsg_id
}

# The following code will create public ip for vm
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.NIC_name}-public-ip"
  location            = var.Loca_name
  resource_group_name = var.RG_name
  allocation_method   = "Static"  # ✅ Required for Standard SKU
  # sku                = "Standard"  # ✅ Explicitly set Standard SKU
}