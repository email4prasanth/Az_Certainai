variable "principal_id" {
  description = "The ID of the principal (Azure AD group or user)"
  type        = string
}

variable "role_definition_name" {
  description = "The role definition name (e.g., Owner, Contributor, Reader)"
  type        = list(string)
}

variable "scope" {
  description = "The scope of the role assignment (e.g., resource group ID)"
  type        = string
}
