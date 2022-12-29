variable "resource_group" {
  description = "Resource Group to which the Storage Account will be deployed"
  type = object({
    name     = string
    location = string
    tags     = map(string)
  })
}

variable "storage_account" {
   description = "Details of the Storage Account to create"
   type = object({
     name                      = string
     account_kind              = string
     account_tier              = string
     account_replication_type  = string
     access_tier               = string
     shared_access_key_enabled = bool
     is_hns_enabled            = bool
     enable_public_access      = bool
     enable_firewall           = bool
     firewall_bypass           = set(string)

     virtual_network_subnet_ids = list(string)

     blob_properties = object({
       delete_retention_days           = number
       container_delete_retention_days = number
       versioning_enabled              = bool
       change_feed_enabled             = bool
       last_access_time_enabled        = bool
     })
   })
}
/**
 variable "use_blob_private_endpoint" {
   description = "Flag to enable Private Endpoint for blob"
   type        = bool
   default     = false
 }

 variable "blob_private_endpoint" {
   description = "Details of the Blob Private Endpoint"
   type = object({
     name      = string
     subnet_id = string

     private_service_connection = object({
       name = string
     })

     dns_zone_group = object({
       name     = string
       zone_ids = list(string)
     })
   })

   default = {
     name      = null
     subnet_id = null

     dns_zone_group = {
       name     = null
       zone_ids = null
     }

     private_service_connection = {
       name = null
     }
   }
 }

 variable "use_file_private_endpoint" {
   description = "Flag to enable Private Endpoint for files"
   type        = bool
   default     = false
 }

 variable "file_private_endpoint" {
   description = "Details of the Files Private Endpoint"
   type = object({
     name      = string
     subnet_id = string

     private_service_connection = object({
       name = string
     })

     dns_zone_group = object({
       name     = string
       zone_ids = list(string)
     })
   })
 }

 variable "use_table_private_endpoint" {
   description = "Flag to enable Private Endpoint for tables"
   type        = bool
   default     = false
 }

 variable "table_private_endpoint" {
   description = "Details of the Table Private Endpoint"
   type = object({
     name      = string
     subnet_id = string

     private_service_connection = object({
       name = string
     })

     dns_zone_group = object({
       name     = string
       zone_ids = list(string)
     })
   })
 }

 variable "use_queue_private_endpoint" {
   description = "Flag to enable Private Endpoint for queues"
   type        = bool
   default     = false
 }

 variable "queue_private_endpoint" {
   description = "Details of the Queue Private Endpoint"
   type = object({
     name      = string
     subnet_id = string

     private_service_connection = object({
       name = string
     })

     dns_zone_group = object({
       name     = string
       zone_ids = list(string)
     })
   })

   default = {
     name      = null
     subnet_id = null

     dns_zone_group = {
       name     = null
       zone_ids = null
     }

     private_service_connection = {
       name = null
     }
   }
 }

 variable "use_web_private_endpoint" {
   description = "Flag to enable Private Endpoint for web"
   type        = bool
   default     = false
 }

 variable "web_private_endpoint" {
   description = "Details of the Web Private Endpoint"
   type = object({
     name      = string
     subnet_id = string

     private_service_connection = object({
       name = string
     })

     dns_zone_group = object({
       name     = string
       zone_ids = list(string)
     })
   })
 }

 variable "use_dfs_private_endpoint" {
   description = "Flag to enable Private Endpoint for dfs"
   type        = bool
   default     = false
 }

 variable "dfs_private_endpoint" {
   description = "Details of the DFS Private Endpoint"
   type = object({
     name      = string
     subnet_id = string

     private_service_connection = object({
       name = string
     })

     dns_zone_group = object({
       name     = string
       zone_ids = list(string)
     })
   })
 }
**/
