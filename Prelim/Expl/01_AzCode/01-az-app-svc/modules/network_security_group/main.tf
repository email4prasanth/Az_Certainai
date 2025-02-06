resource "azurerm_network_security_group" "NSG" {
  name                = var.NSG_name
  location            = var.Loca_name
  resource_group_name = var.RG_name

# Allow all
  security_rule {
    name                       = "Allow-All-Trafic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

#   security_rule {
#     name                       = "Allow-SSH"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "Allow-HTTP"
#     priority                   = 110
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "80"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "Allow-RDP"
#     priority                   = 120
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "3389"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

  tags = var.Tags
}


# NSG to Subnet (Optional)
# resource "azurerm_subnet_network_security_group_association" "example" {
#   subnet_id                 = module.vnet.subnet_id
#   network_security_group_id = azurerm_network_security_group.NSG.id
# }

