### How to Use Workspaces
1. Check Current Workspace
2. Create a New Workspace
3. List All Workspaces
4. Switch Between Workspaces
5. Switch to the prod Workspace
6. Delete a Workspace

- Check the az login and subscription **02Az-interactive login.md**
- Verify the Backend Configuration **03BackendConfiguration.md**

```sh
az login --tenant 023e4694-6942-45bb-902d-48f105a22723 (select subplatform20)
terraform init
terraform workspace show
terraform workspace new dev
terraform workspace new preprod (if required)
terraform workspace new prod (if required)
terraform workspace new prod
terraform workspace list
```
- Open the tf folder location and Swith to dev Workspace and deploy resources 
```sh
terraform init
terraform fmt
terraform validate
terraform workspace select dev
terraform workspace list
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" --auto-approve
terraform state list
terraform output
terraform destroy -var-file="dev.tfvars" --auto-approve
```
- Switch to the prod Workspace and deploy resources 
```sh
terraform workspace select prod
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```
- To delete a workspace (e.g., dev), first switch to another workspace, then run:
```sh
terraform workspace delete dev
```