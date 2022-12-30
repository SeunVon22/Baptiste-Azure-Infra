# output "storage_account" {
#  sensitive = true
#  value     = azurerm_storage_account.main
# }

output "subnet_id" {
  value = [azurerm_subnet.ref_subent.id]
}

output "storage_account" {
  value = tomap({
    for k, accts in azurerm_storage_account.main : k => accts.id
  })
}
