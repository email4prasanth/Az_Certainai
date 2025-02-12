# Resource Group Creation
module "rgroup" {
  source    = "./modules/resource_group"
  RG_name   = "Test-RG"
  Loca_name = "East US"
}
