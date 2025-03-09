module "postgres_database" {
  source                = "./modules/postgres_database"
  postgres_name         = "test-postgres"
  RG_name               = module.rgroup.rg_name
  Loca_name             = module.rgroup.loc_name
  admin_username        = "pgadmin"
  admin_password        = "SecurePassword123!"
  db_name               = "testdb"
#   storage_mb            = 10240 # Ensure at least 10GB
  storage_mb            = 32768  # Minimum 32GB
  subnet_id             = module.vnet.subnet_ids[0]
#   private_dns_zone_id   = module.private_dns_zone.private_dns_zone_id
  public_network_access = false
  Tags                  = { environment = "uat" }
}
