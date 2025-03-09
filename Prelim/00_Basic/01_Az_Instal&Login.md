- Check the version `az version`
### Microsoft Installer (MSI) with PowerShell
- To install the Azure CLI using PowerShell, start PowerShell as administrator and run the following command, change the URL to `https://aka.ms/installazurecliwindowsx64` to install 64 bit as follows
```
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindowsx64 -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi
```
- Now restart the powershell.
- Check if Azure CLI is installed correctly `Get-Command az -ErrorAction SilentlyContinue`.
- Ensure the Azure CLI path is in the system environment variables
- Open Settings → System → About → Advanced system settings.
- Click Environment Variables.
- In System variables, find Path, select it, and click Edit.
- C:\Program Files\Microsoft SDKs\Azure.
> Note: You can also install a specific version.

### Log in to Both Accounts
- I want to work on two different accounts  one is **tut** and another is **dev**
#### Login to the "tut" account
- Search Microsoft Entra ID `az login --tenant 023e4694-6942-45bb-902d-48f105a22723`. I loged in using email `prasanth.aws.tut2@gmail.com`, password `*****@2209` and Microsoft account security code to email.
- Select a subscription and tenant (Type a number or Enter for no changes)
- To see all available subscriptions `az account list --output table`.
- Renaming subscription
```
az account show
az account list --output table
```
- To logout `az logout --tenant 023e4694-6942-45bb-902d-48f105a22723` will logout the default account
#### Login to the "hubino" account
- Search Microsoft Entra ID `az login --tenant <HUBINO_TENANT_ID>`, enter email, password, security method.
- Select a subscription and tenant (Type a number or Enter for no changes)
- To see all available subscriptions `az account list --output table`.
#### Switch Between Accounts
- To switch to the "tut" account `az account set --subscription "tut"`
- To switch to the "hubino" accoun `az account set --subscription "hubino"`

> Optional to set Subscription Id and Tenant Id
> Keep the variable Definitions Without Default Values
    > Environment variables
    > A tfvars file
    > Direct input when running Terraform commands
> Setting the Values Dynamically
    > create tut_env.ps1 or tut_env.sh files to set the environment variables dynamically.
- I intialized using `az login` so i dont want to use tfvars, setting variables dynamically. 

