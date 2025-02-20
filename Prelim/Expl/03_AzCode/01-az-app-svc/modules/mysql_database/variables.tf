variable "mysql_name" {
  description = "The name of the MySQL Flexible Server instance"
  type        = string
}

variable "RG_name" {
  description = "The name of the resource group"
  type        = string
}

variable "Loca_name" {
  description = "The Azure region for the MySQL server"
  type        = string
}

variable "admin_username" {
  description = "MySQL administrator username"
  type        = string
}

variable "admin_password" {
  description = "MySQL administrator password"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "SKU for MySQL instance (e.g., GP_Standard_D2s_v3)"
  type        = string
}

variable "storage_size_gb" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

# variable "ha_mode" {
#   description = "High availability mode (e.g., SameZone, ZoneRedundant, Disabled)"
#   type        = string
#   default     = "Disabled"
# }

variable "allowed_ips" {
  description = "List of allowed IPs for MySQL access"
  type        = list(string)
  default     = ["0.0.0.0"] # Change this to restrict access
}

variable "Tags" {
  description = "Tags for MySQL"
  type        = map(string)
  default     = {}
}
