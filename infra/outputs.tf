output "resource_group_name" {
  description = "Resource group containing the lab resources."
  value       = azurerm_resource_group.security_lab.name
}

output "storage_account_id" {
  description = "ID of the storage account."
  value       = azurerm_storage_account.secure.id
}
