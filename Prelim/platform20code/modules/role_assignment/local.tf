locals {
  #Location
  location = "East US"

  # Define the AD groups for each environment
  ad_groups = {
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
    # },
      "dev" = {
      "dev_devops"     = "platform20 Assist Dev DevOps"
      "dev_developer"  = "platform20 Assist Dev Developer"
      "dev_manager"    = "platform20 Assist Dev Manager"
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