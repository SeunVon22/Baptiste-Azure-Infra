resource_grp = {
  name = "storage_rsrc_grp" 
  location = "East US"
}

storage-accounts = {
  account_kind = "Storage"
  account_replication_type = "LRS"
  account_tier = "Standard"
  blob_properties = {
    change_feed_enabled = false
     
    container_delete_retention_policy = {
      "container_delete_retention_days" = 7
    }
     
    delete_retention_policy = {
      "delete_retention_days" = 7
    }
    last_access_time_enabled = false
    versioning_enabled = false
  }
  location = "East US"
  name = "storagebhsi311222"
  resource_group_name = "value"
  shared_access_key_enabled = false
}

network_config = {
  bypass = [ "Metrics" ]
  default_action = "Deny"
  ip_rules = [ "127.0.0.1" ]
  virtual_network_subnet_ids = [ "${subnet_id}" ]
}