resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "${var.project_name}-${var.environment}-vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.platform20_assist_resource_group.name
  network_interface_ids = [azurerm_network_interface.NIC.id]

  size                            = var.vm_config.vm_size
  admin_username                  = var.vm_config.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.vm_config.admin_username
    public_key = file("C:/Users/Lucky Dell/.ssh/id_rsa.pub") # Path to the public key
    # public_key = file(var.vm_config.ssh_public_key_path) # This is default available in the VM

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_config.os_image.publisher
    offer     = var.vm_config.os_image.offer
    sku       = var.vm_config.os_image.sku
    version   = var.vm_config.os_image.version
  }

  custom_data = base64encode(templatefile("${path.module}/scripts/app-custompackage.tpl", {}))

  tags = var.tags

  # Copy the app-setup.sh script to the VM
  provisioner "file" {
    source      = "${path.module}/scripts/app-setup.sh"
    destination = "/tmp/app-setup.sh"

    connection {
      type        = "ssh"
      host        = azurerm_public_ip.public_ip.ip_address
      user        = var.vm_config.admin_username
      private_key = file("C:/Users/Lucky Dell/.ssh/id_rsa") # Path to the private key
    }
  }

  # Debug: Verify if the file was copied
  provisioner "remote-exec" {
    inline = [
      "ls -l /tmp", # List files in /tmp to verify if app-setup.sh exists
    ]

    connection {
      type        = "ssh"
      host        = azurerm_public_ip.public_ip.ip_address
      user        = var.vm_config.admin_username
      private_key = file("C:/Users/Lucky Dell/.ssh/id_rsa") # Path to the private key
    }
  }

  # Provisioner to execute the app-setup.sh script
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/app-setup.sh", # Ensure the script is executable
      "sudo bash /tmp/app-setup.sh", # Execute the script
    ]

    connection {
      type        = "ssh"
      host        = azurerm_public_ip.public_ip.ip_address
      user        = var.vm_config.admin_username
      private_key = file("C:/Users/Lucky Dell/.ssh/id_rsa") # Path to the private key
    }
  }  

}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

