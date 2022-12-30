resource_group = {
  location = "East US"
  name = "new_bhsi_rg"
  tags = {
    "environment" = "non-prod"
  }
}

storage_account = {
  access_tier = "standard"
  account_kind = "Storage"
  account_replication_type = "GRS"
  account_tier = "Hot"
  blob_properties = {
    change_feed_enabled = false
    container_delete_retention_days = 7
    delete_retention_days = 7
    last_access_time_enabled = false
    versioning_enabled = false
  }
  enable_firewall = false
  enable_public_access = false
  firewall_bypass = [ "Metrics" ]
  is_hns_enabled = false
  name = "test1strg301222bh"
  shared_access_key_enabled = false
  virtual_network_subnet_ids = [ "${subnet_id}" ]
}