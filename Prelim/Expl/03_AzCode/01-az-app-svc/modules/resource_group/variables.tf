variable "RG_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location_name" {
  description = "The Azure region to create the resource group"
  type        = string
  #default     = "East US"
}
