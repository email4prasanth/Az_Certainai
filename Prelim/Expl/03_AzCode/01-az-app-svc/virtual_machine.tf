
module "virtual_machine" {
  source         = "./modules/virtual_machine"
  vm_name        = "dev-vm"
  RG_name        = module.rgroup.rg_name
  Loca_name      = module.rgroup.loc_name
  nic_id         = module.nic.nic_id # Use existing NIC
  vm_size        = "Standard_D2s_v3"
  admin_username = "azureuser"
  admin_password = "MyStrongPassword123!"
  Tags           = { environment = "dev", Project = "VMModule" }
}
