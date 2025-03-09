- To Verify postgres Deployment, this show return **Ready**.
```sh
az postgres flexible-server show --resource-group Test-RG --name test-postgres --query "userVisibleState"
az postgres flexible-server show --resource-group Test-RG --name test-postgres --query "sku.name"
az postgres flexible-server show --resource-group Test-RG --name test-postgres --query "fullyQualifiedDomainName" --output tsv

```
- Test postgres db Connection, If successful, it will return the PostgreSQL version.
```sh
PGPASSWORD="SecurePassword123!" psql -h <POSTGRES_FQDN> -U pgadmin -d testdb -c "SELECT version();"
```
### Steps to Verify PostgreSQL is Working
- Connect to the VM `ssh azureuser@<VM_PUBLIC_IP>`.
- Install PostgreSQL Client (If Not Installed) `sudo apt update && sudo apt install postgresql-client -y`.
- Test Connection to PostgreSQL `PGPASSWORD="SecurePassword123!" psql -h <POSTGRES_FQDN> -U pgadmin -d testdb -c "SELECT version();"`.