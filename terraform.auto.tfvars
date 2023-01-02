resource_grp = {
  name = "storage_rsrc_grp" 
  location = "East US 2"
}

network_config = {
  default_action = "Deny"
  ip_rules = [ "127.0.0.1" ]
  #virtual_network_subnet_ids = [data.azurerm_subnet.ref_subent.id]
  bypass = [ "Metrics" ]
}

storage-accounts = {
  account_kind = "Storage"
  access_tier = "Cool"
  account_replication_type = "LRS"
  account_tier = "Standard"
  blob_properties = {
    change_feed_enabled = false
     
    
    last_access_time_enabled = false
    versioning_enabled = false
  }
  location = "East US 2"
  name = "storagebhsi020123"
  
  shared_access_key_enabled = true
}

delete_retention_policy = {
  "delete_retention_days" = 7
}

container_delete_retention_policy = {
  "container_delete_retention_days" = 7
}