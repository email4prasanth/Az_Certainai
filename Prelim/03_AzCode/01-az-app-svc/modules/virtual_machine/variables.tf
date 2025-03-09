variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "RG_name" {
  description = "The name of the resource group"
  type        = string
}

variable "Loca_name" {
  description = "The Azure region for the VM"
  type        = string
}

variable "nic_id" {
  description = "The ID of the existing Network Interface"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM (e.g., Standard_D2s_v3)"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "Tags" {
  description = "A map of tags for the VM"
  type        = map(string)
  default     = {}
}
