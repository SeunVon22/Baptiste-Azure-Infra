# output "storage_account" {
#  sensitive = true
#  value     = azurerm_storage_account.main
# }

output "storage_account" {
  value = tomap({
    for k, accts in azurerm_storage_account.main : k => accts.id
  })
}
