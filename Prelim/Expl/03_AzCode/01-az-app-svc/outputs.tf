# Reource Group outputs
output "resource_group_name" {
  value = module.rgroup.rg_name
}

# VNET Outputs
output "vnet_name" {
  value = module.vnet.vnet_name
}

# # Single subnet
# output "subnet_id" {
#   value = module.vnet.subnet_id
# }

# Multiple subnets
output "subnet_id" {
  value = module.vnet.subnet_ids
}

# NSG Id
output "nsg_id" {
  value = module.nsg.nsg_id
}

# NIC Id
output "nic_id" {
  value = module.nic.nic_id
}

