# // Create Azure Virtual Network
# resource "azurerm_virtual_network" "virtual_network" {
#   name                = "${terraform.workspace}-ent-assist-vnet"
#   resource_group_name = azurerm_resource_group.enterprise_assist_resource_group.name
#   location            = azurerm_resource_group.enterprise_assist_resource_group.location
#   address_space       = [local.vnet_cidr]
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }

# // Create Subnet for Virtual Machine
# resource "azurerm_subnet" "vm_subnet" {
#   name                 = "${terraform.workspace}-ent-assist-vm-subnet"
#   resource_group_name  = azurerm_resource_group.enterprise_assist_resource_group.name
#   virtual_network_name = azurerm_virtual_network.virtual_network.name
#   address_prefixes     = [cidrsubnet(local.vnet_cidr, 8, 1)]
#   depends_on           = [azurerm_virtual_network.virtual_network]
# }

# // Create Network Security Group for Virtual Machine
# resource "azurerm_network_security_group" "vm_security_group" {
#   name                = "${terraform.workspace}-ent-assist-vm-sg"
#   resource_group_name = azurerm_resource_group.enterprise_assist_resource_group.name
#   location            = azurerm_resource_group.enterprise_assist_resource_group.location
#   tags = {
#     environment = terraform.workspace
#     owner       = "enterprise-assist"
#   }
# }

# // Rule for Virtual Machine network security group
# resource "azurerm_network_security_rule" "vm_security_group_rule" {
#   for_each = {for rule in local.security_group_rules[terraform.workspace]: rule.name => rule}
#   name                        = each.value.name
#   priority                    = each.value.priority
#   direction                   = each.value.direction
#   access                      = each.value.access
#   protocol                    = each.value.protocol
#   source_port_range           = each.value.source_port_range
#   destination_port_range      = each.value.destination_port_range
#   source_address_prefix       = each.value.source_address_prefix
#   destination_address_prefix  = each.value.destination_address_prefix
#   resource_group_name         = azurerm_resource_group.enterprise_assist_resource_group.name
#   network_security_group_name = azurerm_network_security_group.vm_security_group.name
#   depends_on = [azurerm_network_security_group.vm_security_group]
# }

# // Network group association for Virtual Machine Subnet
# resource "azurerm_subnet_network_security_group_association" "network_group_association" {
#   subnet_id = azurerm_subnet.vm_subnet.id
#   network_security_group_id = azurerm_network_security_group.vm_security_group.id
# }