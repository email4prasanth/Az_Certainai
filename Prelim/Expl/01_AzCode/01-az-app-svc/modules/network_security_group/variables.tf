variable "NSG_name" {
  description = "The name of the Network Security Group"
  type        = string
}

variable "RG_name" {
  description = "The name of the resource group"
  type        = string
}

variable "Loca_name" {
  description = "The location/region"
  type        = string
}

variable "Tags" {
  description = "Tags for NSG"
  type        = map(string)
  default     = {}
}
