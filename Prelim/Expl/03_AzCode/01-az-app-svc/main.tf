provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}


module "resource_group" {
  source        = "./modules/resource_group"
  RG_name       = "Test-RG"
  location_name = "East US"
}
