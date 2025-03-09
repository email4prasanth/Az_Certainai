## Resource creation structure in a clear and tidy format
### Step 0: Create Access Management & Key Vault
Action: Create a Access Management & Key Vault using Terraform.
```sh
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📂 docs
│   ├── 📝 architecture.md
│   ├── 📝 setup_guide.md
├── 📝 .gitignore
├── 📝 access_management.tf     # 🆕 New Access Management definition 
├── 📝 dev.tfvars               
├── 📝 global_variables.tf         
├── 📝 key_vault.tf             # 🆕 New Key Vault definition
├── 📝 provider.tf
├── 📝 zetacombine.ps1          
├── 📝 zetacombined.tf  
```        
### Step 1: Create Resource Group
Action: Create a Resource Group using Terraform.
```sh
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📂 docs
│   ├── 📝 architecture.md
│   ├── 📝 setup_guide.md
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 dev.tfvars               
├── 📝 global_variables.tf         
├── 📝 key_vault.tf
├── 📝 provider.tf
├── 📝 resource_group.tf        # 🆕 New Resource Group definition
├── 📝 zetacombine.ps1          
├── 📝 zetacombined.tf    
```      
### Step 2: Set Up Networking
Action: Create Virtual Network (VNet), Subnets, and Network Security Groups (NSGs).
```sh
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📂 docs
│   ├── 📝 architecture.md
│   ├── 📝 setup_guide.md
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 dev.tfvars               
├── 📝 global_variables.tf          
├── 📝 key_vault.tf
├── 📝 network_vnet.tf           # 🆕 New Virtual Network definition 
├── 📝 network_subnet.tf         # 🆕 New SubNet definition 
├── 📝 network_nsg.tf            # 🆕 New NetworkSecurityGroup &Association definition 
├── 📝 network_interface.tf         # 🆕 New Network Interface definition 
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 zetacombine.ps1          
├── 📝 zetacombined.tf
``` 
### Step 3: Set Up Virtual Machine
Action: Create VitualMachine for testing.
```sh
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📂 docs
│   ├── 📝 architecture.md
│   ├── 📝 setup_guide.md
├── 📂 scripts
│   ├── 📝 app-custompackage.tpl
│   ├── 📝 app-setup.sh
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 dev.tfvars               
├── 📝 global_variables.tf      
├── 📝 key_vault.tf
├── 📝 network_vnet.tf           
├── 📝 network_subnet.tf          
├── 📝 network_nsg.tf             
├── 📝 network_interface.tf           
├── 📝 virtual_machine.tf           # 🆕 New Virtual Machine      
├── 📝 networking_nsg.tf                     
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 zetacombine.ps1          
├── 📝 zetacombined.tf
```
- The **terraform state list** exempting key_valut, ad_agroups  
```sh        
azurerm_linux_virtual_machine.vm
azurerm_network_interface.NIC
azurerm_network_interface_security_group_association.nic_nsg
azurerm_network_security_group.nsg
azurerm_public_ip.public_ip
azurerm_resource_group.platform20_assist_resource_group
azurerm_subnet.subnet
azurerm_subnet_network_security_group_association.nsg_association
azurerm_virtual_network.vnet
```