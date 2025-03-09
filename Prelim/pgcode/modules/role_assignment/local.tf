locals {
  #Location
  location = "East US"

  # Define the AD groups for each environment
  ad_groups = {
    # "prod" = {
    #   "prod_devops"    = "Enterprise Assist Prod DevOps"
    #   "prod_developer" = "Enterprise Assist Prod Developer"
    #   "prod_support"   = "Enterprise Assist Prod Support"
    #   "prod_manager"   = "Enterprise Assist Prod Manager"
    # },
    # "preprod" = {
    #   "preprod_devops"     = "Enterprise Assist Preprod DevOps"
    #   "preprod_developer"  = "Enterprise Assist Preprod Developers"
    #   "preprod_manager"    = "Enterprise Assist Preprod Manager"
    # },
      "dev" = {
      "dev_devops"     = "Enterprise Assist Dev DevOps"
      "dev_developer"  = "Enterprise Assist Dev Developer"
      "dev_manager"    = "Enterprise Assist Dev Manager"
    }
  }

  # Define role assignments for each environment
  role_assignments = {
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
    # },
    "dev" = {
      "dev_devops"      = { role = ["Contributor"] },
      "dev_developer"   = { role = ["Reader", "AcrPull", "AcrPush", "Virtual Machine Administrator Login"] },
      "dev_manager"     = { role = ["Reader"] }
    }
  }
}