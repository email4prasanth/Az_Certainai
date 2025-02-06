# Network Security Group and rules
module "nsg" {
  source    = "./modules/network_security_group"
  NSG_name  = "Test-NSG"
  RG_name   = module.rgroup.rg_name
  Loca_name = module.rgroup.loc_name
  Tags      = { "environment" = "uat" }
}
