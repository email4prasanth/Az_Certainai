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

# Virtual Network Creation with single subnet
module "vnet" {
  source           = "./modules/virtual_network"
  Vnet_name        = "Test-VNet"
  RG_name          = module.rgroup.rg_name
  Loca_name        = module.rgroup.loc_name
  Address_space    = ["10.0.0.0/16"]
  Address_prefixes = ["10.0.2.0/24"]
  Tags             = { "environment" = "uat" }
}

# Network Security Group and rules
module "nsg" {
  source    = "./modules/network_security_group"
  NSG_name  = "Test-NSG"
  RG_name   = module.rgroup.rg_name
  Loca_name = module.rgroup.loc_name
  Tags      = { "environment" = "uat" }
}


