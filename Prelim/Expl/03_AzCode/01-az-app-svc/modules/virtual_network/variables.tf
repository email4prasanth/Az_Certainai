variable "Vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "RG_name" {
  description = "The name of the resource group to associate with the VNet"
  type        = string
}

variable "Loca_name" {
  description = "The Azure region to create the VNet"
  type        = string
}

variable "Address_space" {
  description = "The address space of the VNet"
  type        = list(string)
}

# Single Subnet
variable "Address_prefixes" {
  description = "The address space of the VNet"
  type        = list(string)
}

variable "Tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
