
module "load_balancer" {
  source    = "./modules/load_balancer"
  lb_name   = "Test-LB"
  RG_name   = module.rgroup.rg_name
  Loca_name = module.rgroup.loc_name
  Tags      = { "environment" = "uat" }
}
