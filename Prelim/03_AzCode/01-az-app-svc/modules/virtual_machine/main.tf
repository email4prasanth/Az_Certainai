resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.Loca_name
  resource_group_name = var.RG_name

  # Attach to existing NIC
  network_interface_ids = [var.nic_id]

  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false  # Set to true if using SSH keys

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  tags = var.Tags
}
