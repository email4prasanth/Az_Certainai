# Network Interface for multiple subnets
module "nic" {
  source     = "./modules/network_interface"
  NIC_name   = "Test-NIC"
  RG_name    = module.rgroup.rg_name
  Loca_name  = module.rgroup.loc_name
  Subnet_ids = module.vnet.subnet_ids
  Nsg_id     = module.nsg.nsg_id
  Tags       = { "environment" = "uat" }
}