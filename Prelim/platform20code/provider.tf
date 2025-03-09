terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "platform20-assist-terraform"
    storage_account_name = "platform20terraformhub"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }
}