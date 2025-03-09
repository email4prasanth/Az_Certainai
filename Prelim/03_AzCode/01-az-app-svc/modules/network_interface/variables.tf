variable "NIC_name" {
  description = "The name of the Network Interface"
  type        = string
}

variable "RG_name" {
  description = "The name of the resource group"
  type        = string
}

variable "Loca_name" {
  description = "The Azure location/region"
  type        = string
}

# Multiple subnet
variable "Subnet_ids" {
  description = "The ID of the subnet"
  type        = list(string)  
}

variable "Nsg_id" {
  description = "The ID of the Network Security Group"
  type        = string
}

variable "Tags" {
  description = "Tags for NIC"
  type        = map(string)
  default     = {}
}
