# // Create SSH Key for VM
# resource "tls_private_key" "ssh_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# // Create Public Ip for Virtual Machine
# resource "azurerm_public_ip" "public_ip" {
#   name                = "${terraform.workspace}-ent-assist-vm-pub-ip"
#   resource_group_name = azurerm_resource_group.enterprise_assist_resource_group.name
#   location            = azurerm_resource_group.enterprise_assist_resource_group.location
#   allocation_method   = "Static"
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }

# // Create Network Interface for Virtual Machine
# resource "azurerm_network_interface" "network_interface" {
#   name                = "${terraform.workspace}-ent-assist-vm-nic"
#   resource_group_name = azurerm_resource_group.enterprise_assist_resource_group.name
#   location            = azurerm_resource_group.enterprise_assist_resource_group.location

#   ip_configuration {
#     name                          = "${terraform.workspace}-ip-config"
#     subnet_id                     = azurerm_subnet.vm_subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.public_ip.id
#   }
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }

# // Create Linux Virtual Machine
# resource "azurerm_linux_virtual_machine" "virtual_machine" {
#   name                  = "${terraform.workspace}-ent-assist-vm"
#   resource_group_name   = azurerm_resource_group.enterprise_assist_resource_group.name
#   location              = azurerm_resource_group.enterprise_assist_resource_group.location
#   size                  = local.instance_type[terraform.workspace]
#   admin_username        = "adminuser"
#   network_interface_ids = [azurerm_network_interface.network_interface.id]

#   custom_data = filebase64("customdata.tpl")

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = tls_private_key.ssh_key.public_key_openssh
#   }
#   identity {
#     type = "SystemAssigned"
#   }
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#     disk_size_gb         = local.instance_os_disk_size_gb[terraform.workspace]
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
#   depends_on = [
#     azurerm_network_interface.network_interface,
#     azurerm_public_ip.public_ip,
#     azurerm_subnet_network_security_group_association.network_group_association
#   ]
# }

# // Role assignment for VM to access the Container Registry
# resource "azurerm_role_assignment" "vm_acr_pull" {
#   scope                = azurerm_container_registry.container_registry.id
#   role_definition_name = "AcrPull"
#   principal_id         = azurerm_linux_virtual_machine.virtual_machine.identity[0].principal_id
#   depends_on = [
#     azurerm_linux_virtual_machine.virtual_machine,
#     azurerm_container_registry.container_registry
#   ]
# }

# // Azure AD authentication extension for Virtual Machine
# resource "azurerm_virtual_machine_extension" "vm_aad_auth" {
#   name                       = "AADLoginForVirtualMachine"
#   virtual_machine_id         = azurerm_linux_virtual_machine.virtual_machine.id
#   publisher                  = "Microsoft.Azure.ActiveDirectory"
#   type                       = "AADSSHLoginForLinux"
#   type_handler_version       = "1.0"
#   auto_upgrade_minor_version = true
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
#   depends_on                 = [azurerm_linux_virtual_machine.virtual_machine]
# }

# // Output to get the VM public Ip
# output "vm_public_ip" {
#   value = azurerm_public_ip.public_ip.ip_address
# }