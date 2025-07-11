variable "resource_grp" {
  type = map(any)
  description = "resource group of storage account"
}
# Define a map of storage accounts to create
variable "storage-accounts" {
  description = "The values for the storage accounts"
  type = object({
    name = string
    
    location = string
    account_kind             = string
    access_tier = string
    account_tier             = string
    account_replication_type = string
    shared_access_key_enabled = bool
    
    blob_properties = object({
      
      versioning_enabled       = bool
      change_feed_enabled      = bool
      last_access_time_enabled = bool

    })
  })
  
}

variable "delete_retention_policy" {
  type = map(number)
}

variable "container_delete_retention_policy" {
  type = map(number)
}

variable "network_config" {
  description = "Allowed subnets"
  type = object({
    default_action             = string
    ip_rules                   = set(string)
    virtual_network_subnet_ids = set(string)
    bypass                     = set(string)
  })
}
/*
variable "net-rules" {
  type = object({
    default_action             = string
    ip_rules                   = set(string)
    virtual_network_subnet_ids = set(string)
  })
  description = "(optional) describe your variable"
}
*/