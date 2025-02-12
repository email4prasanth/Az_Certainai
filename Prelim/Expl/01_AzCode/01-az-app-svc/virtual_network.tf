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
