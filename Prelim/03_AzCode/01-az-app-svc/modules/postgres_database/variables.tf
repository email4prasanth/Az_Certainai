variable "postgres_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "RG_name" {
  description = "The name of the resource group"
  type        = string
}

variable "Loca_name" {
  description = "The Azure region"
  type        = string
}

variable "admin_username" {
  description = "Admin username for PostgreSQL"
  type        = string
}

variable "admin_password" {
  description = "Admin password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "storage_mb" {
  description = "The storage size in MB (min 10240 for GP_Standard_D2ds_v4)"
  type        = number
#   default     = 20480
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

# variable "private_dns_zone_id" {
#   description = "The ID of the private DNS zone"
#   type        = string
# }

variable "public_network_access" {
  description = "Enable or disable public access"
  type        = bool
  default     = false
}

variable "Tags" {
  description = "A map of tags"
  type        = map(string)
  default     = {}
}
