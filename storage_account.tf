data "azurerm_subnet" "ref_subent" {
  name = "subnet2"
  virtual_network_name = "TestVNet"
  resource_group_name = "Terrarsrc-RG"
}


resource "azurerm_storage_account" "main" {
  
  for_each = var.storage_account
    name                     = each.value.name
    resource_group_name      = var.resource_group.name
    location                 = var.resource_group.location
    account_tier             = each.value.account_tier
    account_replication_type = each.value.account_replication_type

    account_kind                    = each.value.account_kind
    access_tier                     = each.value.access_tier
    shared_access_key_enabled       = each.value.shared_access_key_enabled
    is_hns_enabled                  = each.value.is_hns_enabled
    allow_nested_items_to_be_public = each.value.enable_public_access
    enable_https_traffic_only       = true
    min_tls_version                 = "TLS1_2"

    identity {
      type = "SystemAssigned"
    }

    blob_properties {
      versioning_enabled       = each.value.blob_properties.versioning_enabled
      change_feed_enabled      = each.value.blob_properties.change_feed_enabled
      last_access_time_enabled = each.value.blob_properties.last_access_time_enabled

      delete_retention_policy {
        days = each.value.blob_properties.delete_retention_days
      }

      container_delete_retention_policy {
        days = each.value.blob_properties.container_delete_retention_days
      }
    }

    network_rules {
      default_action = each.value.enable_firewall ? "Deny" : "Allow"
      bypass         = each.value.firewall_bypass
      virtual_network_subnet_ids = each.value.virtual_network_subnet_ids
    }
}

# The network rules for the storage accounts
resource "azurerm_storage_account_network_rules" "network-Configuration" {
    depends_on = [
      azurerm_storage_account.main
    ]
    
  storage_account_id = azurerm_storage_account.main.id
  for_each = var.network_config
  
  default_action             = each.value.default_action
  ip_rules                   = each.value.ip_rules
  virtual_network_subnet_ids = each.value.virtual_network_subnet_ids
  bypass                     = each.value.bypass
}


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
