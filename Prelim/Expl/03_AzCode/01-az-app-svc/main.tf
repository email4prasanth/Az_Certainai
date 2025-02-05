provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  RG_name = "Test-RG"
  location_name            = "East US"
}
