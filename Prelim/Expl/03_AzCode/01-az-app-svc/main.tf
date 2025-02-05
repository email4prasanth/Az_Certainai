provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

# Resource Group Creation
module "rgroup" {
  source    = "./modules/resource_group"
  RG_name   = "Test-RG"
  Loca_name = "East US"
}

# # Virtual Network Creation with single subnet
# module "vnet" {
#   source           = "./modules/virtual_network"
#   Vnet_name        = "Test-VNet"
#   RG_name          = module.rgroup.rg_name
#   Loca_name        = module.rgroup.loc_name
#   Address_space    = ["10.0.0.0/16"]
#   Address_prefixes = ["10.0.2.0/24"]
#   Tags             = { "environment" = "uat" }
# }

# Virtual Network Creation with Multiple subnet
module "vnet" {
  source        = "./modules/virtual_network"
  Vnet_name     = "Test-VNet"
  RG_name       = module.rgroup.rg_name
  Loca_name     = module.rgroup.loc_name
  Address_space = ["10.0.0.0/16"]
  Tags          = { "environment" = "uat" }

  subnets = [
    { name = "subnet1", address_prefix = "10.0.1.0/24" },
    { name = "subnet2", address_prefix = "10.0.2.0/24" }
  ]
}


# Network Security Group and rules
module "nsg" {
  source    = "./modules/network_security_group"
  NSG_name  = "Test-NSG"
  RG_name   = module.rgroup.rg_name
  Loca_name = module.rgroup.loc_name
  Tags      = { "environment" = "uat" }
}


# Network Interface for multiple subnets
module "nic" {
  source    = "./modules/network_interface"
  NIC_name  = "Test-NIC"
  RG_name   = module.rgroup.rg_name
  Loca_name = module.rgroup.loc_name
  # Subnet_id = module.vnet.subnet_id # For single subnet
  Subnet_ids = module.vnet.subnet_ids
  Nsg_id    = module.nsg.nsg_id
  Tags      = { "environment" = "uat" }
}