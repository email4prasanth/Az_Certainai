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
terraform apply -var-file="tut-ws.tfvars" --auto-approve
```

- General instruction
```
terraform init
terraform workspace list
terraform workspace select tut-ws
terraform workspace show
terraform plan -var-file="tut-ws.tfvars"
terraform apply -var-file="tut-ws.tfvars" --auto-approve
terraform state list
terraform output
terraform destroy -var-file="tut-ws.tfvars" --auto-approve
```
- Imports existing infrastructure into your Terraform state
```
terraform import aws_instance.my_instance i-1234567890abcdef0
```
-  Terraform State Commands
```
terraform state show aws_instance.my_instance
terraform state mv aws_instance.my_instance aws_instance.new_instance
terraform state rm aws_instance.my_instance
```
- Taint (Marks a resource for recreation), provider, graph
```
terraform taint aws_instance.my_instance
terraform untaint aws_instance.my_instance
terraform graph | dot -Tpng > graph.png
```