variable "lb_name" {
  description = "The name of the Load Balancer"
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

variable "Tags" {
  description = "Tags for the Load Balancer"
  type        = map(string)
  default     = {}
}

variable "enable_nat_rule" {
  description = "Enable NAT rule for SSH access"
  type        = bool
  default     = false
}
