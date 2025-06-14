resource "azurerm_cosmosdb_mongo_database" "mongodb" {
    for_each =var.mongodb
  name                = try(each.value.name,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  account_name        = data.azurerm_cosmosdb_account.cosmosdb.name
#   throughput          = try(each.value.throughput , null)
  
#   dynamic "autoscale_settings" {
#     for_each = try(each.value.autoscale_settings ,null) != null ? [each.value.autoscale_settings] : []
#     content {
#     max_throughput   =try(autoscale_settings.value.max_throughput,null)
#   }
}

