1. [✅ Done] Create Resource Group
Updated Folder Structure:
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 key_vault.tf
├── 📝 provider.tf
├── 📝 resource_group.tf         # ✅ Done
├── 📝 variables.tf
├── 📝 dev.tfvars
├── 📝 zetacombined.tf
├── 📝 zetacombine.ps1
2. Create Azure Key Vault
Updated Folder Structure:
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 key_vault.tf              # 🆕 New Key Vault definition
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 variables.tf
├── 📝 dev.tfvars
├── 📝 zetacombined.tf
├── 📝 zetacombine.ps1
3. Configure Access Management (Role Assignments)
Updated Folder Structure:
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment       # 🆕 New module for role assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📝 .gitignore
├── 📝 access_management.tf     # 🆕 New access management config
├── 📝 key_vault.tf
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 variables.tf
├── 📝 dev.tfvars
├── 📝 zetacombined.tf
├── 📝 zetacombine.ps1
4. Create Virtual Network and Subnets
Updated Folder Structure:


📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 network               # 🆕 New module for VNet and subnets
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 key_vault.tf
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 variables.tf
├── 📝 dev.tfvars
├── 📝 zetacombined.tf
├── 📝 zetacombine.ps1
5. Deploy Azure App Services and Backend APIs
Updated Folder Structure:


📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 network
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 app_service           # 🆕 New module for Azure App Service
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 key_vault.tf
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 variables.tf
├── 📝 dev.tfvars
├── 📝 zetacombined.tf
├── 📝 zetacombine.ps1
6. Add Azure Front Door (WAF/CDN)
Updated Folder Structure:
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 network
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 app_service
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 front_door            # 🆕 New module for Azure Front Door
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 key_vault.tf
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 variables.tf
├── 📝 dev.tfvars
├── 📝 zetacombined.tf
├── 📝 zetacombine.ps1
7. Add Monitoring and Diagnostics (Azure Monitor, Log Analytics)
Updated Folder Structure:
📂 platform20code
├── 📂 modules
│   ├── 📂 ad_groups
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 role_assignment
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 network
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 app_service
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 front_door
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
│   ├── 📂 monitoring           # 🆕 New module for monitoring
│   │   ├── 📝 main.tf
│   │   ├── 📝 variables.tf
├── 📝 .gitignore
├── 📝 access_management.tf
├── 📝 key_vault.tf
├── 📝 provider.tf
├── 📝 resource_group.tf
├── 📝 variables.tf
├── 📝 dev.tfvars
├── 📝 zetacombined.tf
├── 📝 zetacombine.ps1