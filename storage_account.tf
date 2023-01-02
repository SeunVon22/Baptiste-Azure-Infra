data "azurerm_subnet" "ref_subent" {
  name = "default"
  virtual_network_name = "MyNuRG-vnet"
  resource_group_name = "MyNuRG"
}

resource "azurerm_resource_group" "rg-grp" {
  name     = var.resource_grp.name
  location = var.resource_grp.location
}

resource "azurerm_storage_account" "main" {
  
    name                     = var.storage-accounts.name
    resource_group_name      = azurerm_resource_group.rg-grp.name
    location                 = var.resource_grp.location
    account_tier             = var.storage-accounts.account_tier
    account_replication_type = var.storage-accounts.account_replication_type

    account_kind                    = var.storage-accounts.account_kind
    access_tier                     = var.storage-accounts.access_tier
    shared_access_key_enabled       = var.storage-accounts.shared_access_key_enabled
    #is_hns_enabled                  = var.storage-accounts.is_hns_enabled
    #allow_nested_items_to_be_public = var.storage-accounts.enable_public_access
    enable_https_traffic_only       = true
    min_tls_version                 = "TLS1_2"

    identity {
      type = "SystemAssigned"
    }

    blob_properties {
      versioning_enabled       = var.storage-accounts.blob_properties.versioning_enabled
      change_feed_enabled      = var.storage-accounts.blob_properties.change_feed_enabled
      last_access_time_enabled = var.storage-accounts.blob_properties.last_access_time_enabled

      delete_retention_policy {
        days = var.delete_retention_policy.delete_retention_days
      }

      container_delete_retention_policy {
        days = var.container_delete_retention_policy.container_delete_retention_days
      }
    }

    
}

# The network rules for the storage accounts
resource "azurerm_storage_account_network_rules" "network-Configuration" {
    depends_on = [
      azurerm_storage_account.main
    ]
    
  storage_account_id = azurerm_storage_account.main.id
  for_each = var.network_config
  
  default_action             = var.network_config.default_action
  ip_rules                   = var.network_config.ip_rules
  virtual_network_subnet_ids = [data.azurerm_subnet.ref_subent.id]
  bypass                     = var.network_config.bypass
}
/*
resource "azurerm_storage_container" "containe1" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}
*/

# ORIGINAL COPY

# resource "azurerm_storage_account" "main" {
#   for_each = var.storage_account
#     name                     = var.storage_account.name
#     resource_group_name      = var.resource_group.name
#     location                 = var.resource_group.location
#     account_tier             = var.storage_account.account_tier
#     account_replication_type = var.storage_account.account_replication_type

#     tags                            = var.resource_group.tags
#     account_kind                    = var.storage_account.account_kind
#     access_tier                     = var.storage_account.access_tier
#     shared_access_key_enabled       = var.storage_account.shared_access_key_enabled
#     is_hns_enabled                  = var.storage_account.is_hns_enabled
#     allow_nested_items_to_be_public = var.storage_account.enable_public_access
#     enable_https_traffic_only       = true
#     min_tls_version                 = "TLS1_2"

#     identity {
#       type = "SystemAssigned"
#     }

#     blob_properties {
#       versioning_enabled       = var.storage_account.blob_properties.versioning_enabled
#       change_feed_enabled      = var.storage_account.blob_properties.change_feed_enabled
#       last_access_time_enabled = var.storage_account.blob_properties.last_access_time_enabled

#       dynamic "delete_retention_policy" {
#         for_each = var.storage_account.blob_properties.delete_retention_days != null ? [1] : []

#         content {
#           days = var.storage_account.blob_properties.delete_retention_days
#         }
#       }

#       dynamic "container_delete_retention_policy" {
#         for_each = var.storage_account.blob_properties.container_delete_retention_days != null ? [1] : []

#         content {
#           days = var.storage_account.blob_properties.container_delete_retention_days
#         }
#       }
#     }

#     network_rules {
#       default_action = var.storage_account.enable_firewall ? "Deny" : "Allow"
#       bypass         = var.storage_account.firewall_bypass
#       virtual_network_subnet_ids = var.storage_account.virtual_network_subnet_ids
#     }
# }
