output "rg_name" {
  value = azurerm_resource_group.RG.name  # (OR) value = var.RG_name
}

output "loc_name" {
  value = var.Loca_name
}

output "resource_group_id" {
  value = azurerm_resource_group.RG.id
}


