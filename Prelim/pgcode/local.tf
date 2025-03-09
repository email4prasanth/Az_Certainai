locals {
  #Location
  location = "East US"

  # Define the AD groups for each environment
  ad_groups = {
    "prod" = {
      "prod_devops"    = "Enterprise Assist Prod DevOps"
      "prod_developer" = "Enterprise Assist Prod Developer"
      "prod_support"   = "Enterprise Assist Prod Support"
      "prod_manager"   = "Enterprise Assist Prod Manager"
    },
    "preprod" = {
      "preprod_devops"     = "Enterprise Assist Preprod DevOps"
      "preprod_developer"  = "Enterprise Assist Preprod Developers"
      "preprod_manager"    = "Enterprise Assist Preprod Manager"
    },
      "dev" = {
      "dev_devops"     = "Enterprise Assist Dev DevOps"
      "dev_developer"  = "Enterprise Assist Dev Developer"
      "dev_manager"    = "Enterprise Assist Dev Manager"
    }
  }

  # Define role assignments for each environment
  role_assignments = {
    "dev" = {
      "dev_devops"      = { role = ["Contributor"] },
      "dev_developer"   = { role = ["Reader", "AcrPull", "AcrPush", "Virtual Machine Administrator Login"] },
      "dev_manager"     = { role = ["Reader"] }
    },
    "preprod" = {
      "preprod_devops"      = { role = ["Contributor"] },
      "preprod_developer"   = { role = ["Reader", "AcrPull", "AcrPush", "Virtual Machine Administrator Login"] },
      "preprod_manager"     = { role = ["Reader"] }
    },
    "prod" = {
      "prod_devops"     = { role = ["Contributor"] },
      "prod_developer"  = { role = ["Reader"] },
      "prod_support"    = { role = ["Reader"] },
      "prod_manager"    = { role = ["Reader"] }
    }
  }

  # Define the CIDR ranges for each environment
  cidr_ranges = {
    "dev"     = "10.100.0.0/16"
    "preprod" = "10.101.0.0/16"
    "prod"    = "10.102.0.0/16"
  }

  vnet_cidr = lookup(local.cidr_ranges, terraform.workspace)

  # Define the VM instance type for each environment
  instance_type = {
    "dev"     = "Standard_B4as_v2"
    "preprod" = "Standard_B4as_v2"
    "prod"    = "Standard_B8als_v2"
  }

  # Define the VM's OS disk size for each environment
  instance_os_disk_size_gb = {
    "dev"     = 256
    "preprod" = 256
    "prod"    = 512
  }

  # Define the VM's security group rules for each environment
  security_group_rules = {
    "dev" = [
      {
        name                       = "allow-all"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    "preprod" = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-http"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    "prod" = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-http"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}
