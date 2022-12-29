/**
 module "blob_private_endpoint" {
   count = var.use_blob_private_endpoint ? 1 : 0

   source  = "app.terraform.io/Baptist-Health/private-endpoint/azurerm"
   version = "1.0.0"

   private_endpoint = merge(var.blob_private_endpoint,
     {
       private_service_connection = merge(var.blob_private_endpoint.private_service_connection, {
         resource_id       = azurerm_storage_account.main.id
         subresource_names = ["blob"]
       })
   })
   resource_group = var.resource_group
 }

 module "table_private_endpoint" {
   count = var.use_table_private_endpoint ? 1 : 0

   source  = "app.terraform.io/Baptist-Health/private-endpoint/azurerm"
   version = "1.0.0"

   private_endpoint = merge(var.table_private_endpoint,
     {
       private_service_connection = merge(var.table_private_endpoint.private_service_connection, {
         resource_id       = azurerm_storage_account.main.id
         subresource_names = ["table"]
       })
   })
   resource_group = var.resource_group
 }

 module "queue_private_endpoint" {
   count = var.use_queue_private_endpoint ? 1 : 0

   source  = "app.terraform.io/Baptist-Health/private-endpoint/azurerm"
   version = "1.0.0"

   private_endpoint = merge(var.queue_private_endpoint,
     {
       private_service_connection = merge(var.queue_private_endpoint.private_service_connection, {
         resource_id       = azurerm_storage_account.main.id
         subresource_names = ["queue"]
       })
   })
   resource_group = var.resource_group
 }

 module "file_private_endpoint" {
   count = var.use_file_private_endpoint ? 1 : 0

   source  = "app.terraform.io/Baptist-Health/private-endpoint/azurerm"
   version = "1.0.0"

   private_endpoint = merge(var.file_private_endpoint,
     {
       private_service_connection = merge(var.file_private_endpoint.private_service_connection, {
         resource_id       = azurerm_storage_account.main.id
         subresource_names = ["file"]
       })
   })
   resource_group = var.resource_group
 }


 module "web_private_endpoint" {
   count = var.use_web_private_endpoint ? 1 : 0

   source  = "app.terraform.io/Baptist-Health/private-endpoint/azurerm"
   version = "1.0.0"

   private_endpoint = merge(var.web_private_endpoint,
     {
       private_service_connection = merge(var.web_private_endpoint.private_service_connection, {
         resource_id       = azurerm_storage_account.main.id
         subresource_names = ["web"]
       })
   })
   resource_group = var.resource_group
 }


 module "dfs_private_endpoint" {
   count = var.use_dfs_private_endpoint ? 1 : 0

   source  = "app.terraform.io/Baptist-Health/private-endpoint/azurerm"
   version = "1.0.0"

   private_endpoint = merge(var.dfs_private_endpoint,
     {
       private_service_connection = merge(var.dfs_private_endpoint.private_service_connection, {
         resource_id       = azurerm_storage_account.main.id
         subresource_names = ["dfs"]
       })
   })
   resource_group = var.resource_group
}
**/
