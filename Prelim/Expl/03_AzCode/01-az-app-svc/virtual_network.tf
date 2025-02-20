# Virtual Network Creation with Multiple subnet
module "vnet" {
  source        = "./modules/virtual_network"
  Vnet_name     = "Test-VNet"
  RG_name       = module.rgroup.rg_name
  Loca_name     = module.rgroup.loc_name
  Address_space = ["10.0.0.0/16"]
  Tags          = { "environment" = "uat" }

  subnets = [
    # { name = "subnet2", address_prefix = "10.0.2.0/24" },
    { name = "subnet1", address_prefix = "10.0.1.0/24" }
  ]
}