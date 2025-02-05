- Create Workspaces for Different Accounts
```
terraform init
terraform workspace new tut-ws
terraform workspace new hubino-ws
terraform workspace list
# Switch to the desired workspace
terraform workspace select tut-ws
terraform workspace select hubino-ws
```
- Create terraform.tfvars for Each Workspace
```
For tut-ws (tut-ws.tfvars)
For hubino-ws (hubino-ws.tfvars)
```
- Apply Workspace-Specific Configuration
```
terraform workspace select tut-ws
terraform plan -var-file="tut-ws.tfvars"
terraform apply -var-file="tut-ws.tfvars --apply-autoapprove"
```
- error solving Azure Resource Provider 
```
az provider register --namespace Microsoft.Maps
az provider register --namespace Microsoft.Management
```
- Then, verify if they are registered
```
az provider show --namespace Microsoft.Maps --query "id"
az provider show --namespace Microsoft.Management --query "id"
az provider show --namespace Microsoft.Maps --query "registrationState"
az provider show --namespace Microsoft.Management --query "registrationState"
```
If they return "Registered", retry 
```
terraform plan -var-file="tut-ws.tfvars"
terraform apply -var-file="tut-ws.tfvars --apply-autoapprove
```