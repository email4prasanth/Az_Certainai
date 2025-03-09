variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "The Azure tenant ID"
}

variable "location" {
  type        = string
  description = "The Azure region to deploy resources"
  # default     = "East US"
}

variable "environment" {
  type        = string
  description = "The environment name (e.g., dev, preprod, prod)"
}

variable "project_name" {
  type        = string
  description = "The name of the resource group"
}

# variable "key_vault_name" {
#   type        = string
#   description = "The name of the Key Vault"
# }

variable "vnet_cidr" {
  description = "CIDR block for the virtual network"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default = {
    owner       = "platform20"
    environment = "dev" # Default value, can be overridden
  }
}

variable "vm_config" {
  type = object({
    vm_size        = string
    admin_username = string
    os_image = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    ssh_public_key_path = string
  })
  description = "Configuration for the virtual machine"
}

# AD Groups
variable "ad_groups" {
  type        = map(map(string))
  description = "Azure AD groups for each environment"
  default = {
    "dev" = {
      "dev_devops"    = "platform20 Assist Dev DevOps"
      "dev_developer" = "platform20 Assist Dev Developer"
      "dev_manager"   = "platform20 Assist Dev Manager"
    }
    # Uncomment for other environments
    # "prod" = {
    #   "prod_devops"    = "platform20 Assist Prod DevOps"
    #   "prod_developer" = "platform20 Assist Prod Developer"
    #   "prod_support"   = "platform20 Assist Prod Support"
    #   "prod_manager"   = "platform20 Assist Prod Manager"
    # },
    # "preprod" = {
    #   "preprod_devops"     = "platform20 Assist Preprod DevOps"
    #   "preprod_developer"  = "platform20 Assist Preprod Developers"
    #   "preprod_manager"    = "platform20 Assist Preprod Manager"
    # }
  }
}

# Role Assignments
variable "role_assignments" {
  type        = map(map(map(list(string))))
  description = "Role assignments for each environment"
  default = {
    "dev" = {
      "dev_devops"    = { role = ["Contributor"] }
      "dev_developer" = { role = ["Reader", "AcrPull", "AcrPush", "Virtual Machine Administrator Login"] }
      "dev_manager"   = { role = ["Reader"] }
    }
    # Uncomment for other environments
    # "prod" = {
    #   "prod_devops"     = { role = ["Contributor"] },
    #   "prod_developer"  = { role = ["Reader"] },
    #   "prod_support"    = { role = ["Reader"] },
    #   "prod_manager"    = { role = ["Reader"] }
    # },
    # "preprod" = {
    #   "preprod_devops"      = { role = ["Contributor"] },
    #   "preprod_developer"   = { role = ["Reader", "AcrPull", "AcrPush", "Virtual Machine Administrator Login"] },
    #   "preprod_manager"     = { role = ["Reader"] }
    # }
  }
}