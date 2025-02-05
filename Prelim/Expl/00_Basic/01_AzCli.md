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