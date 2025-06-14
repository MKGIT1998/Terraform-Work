resource "azurerm_cosmosdb_mongo_collection" "new_collection" {
  for_each = var.new_collection
  name                = try(each.value.name,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  account_name        = data.azurerm_cosmosdb_account.cosmosdb.name
  database_name       = data.azurerm_cosmosdb_mongo_database.mongodb.name

  default_ttl_seconds = try(each.value.default_ttl_seconds,null)
  shard_key         = try(each.value.shard_key,null)
  
  # throughput          = try(each.value.throughput,null)
  # analytical_storage_ttl = try(each.value.analytical_storage_ttl,null)
#   dynamic "autoscale_settings" {
#     for_each = try(each.value.autoscale_settings ,null) != null ? [each.value.autoscale_settings] : []
#     content {
#     max_throughput   =try(autoscale_settings.value.max_throughput,null)
#   }
  dynamic "index" {
   for_each = try(each.value.index ,null) != null ? [each.value.index] : []
    content {
    keys   = try(index.value.keys,null)
    unique = try(index.value.unique,null)
  }
}
}