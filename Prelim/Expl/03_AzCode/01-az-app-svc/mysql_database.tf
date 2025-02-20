module "mysql_database" {
  source                = "./modules/mysql_database"
  mysql_name            = "testmysqldbserver"
  RG_name               = module.rgroup.rg_name
  Loca_name             = module.rgroup.loc_name
  admin_username        = "adminuser"
  admin_password        = "SecurePassword123!"
  sku_name              = "B_Standard_B1ms" # Updated SKU
  storage_size_gb       = 20
  backup_retention_days = 7
  allowed_ips           = ["0.0.0.0"]
  Tags                  = { environment = "dev", Project = "MySQLModule" }
}