# provider "azurerm" {
#   features {}

#   subscription_id = var.subscription_id
#   tenant_id       = var.tenant_id
# }


# module "resource_group" {
#   source    = "./modules/resource_group"
#   RG_name   = "Test-RG"
#   Loca_name = "East US"
# }


# module "vnet" {
#   source              = "./modules/vnet"
#   Vnet_name           = "Test-VNet"
#   RG_name = module.resource_group.rg_name
#   Loca_name           = module.resource_group.loc_name
#   address_space       = ["10.0.0.0/16"]
#   tags                = { "environment" = "uat" }
# }

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "resource_group" {
  source    = "./modules/resource_group"
  RG_name   = "Test-RG"
  Loca_name = "East US"
}

module "vnet" {
  source        = "./modules/vnet"
  Vnet_name     = "Test-VNet"
  RG_name       = module.resource_group.rg_name
  Loca_name     = module.resource_group.loc_name
  address_space = ["10.0.0.0/16"]
  tags          = { "environment" = "uat" }
}

output "resource_group_name" {
  value = module.resource_group.rg_name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "vnet_id" {
  value = module.vnet.vnet_id
}
