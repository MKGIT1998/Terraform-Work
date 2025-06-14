resource "azurerm_cosmosdb_sql_database" "sqldb" {
    for_each = var.sqldb
  name                = try(each.value.name,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  account_name        = data.azurerm_cosmosdb_account.cosmosdb.name
#   throughput          = try(each.value.throughput,null)
#   dynamic "autoscale_settings" {
#     for_each = try(each.value.autoscale_settings ,null) != null ? [each.value.autoscale_settings] : []
#     content {
#     max_throughput   =try(autoscale_settings.value.max_throughput,null)
#   }
}
resource "azurerm_cosmosdb_sql_container" "sqlcontainer" {
    for_each = var.sqlcontainer
  name                  = try(each.value.name,null)
  resource_group_name   = data.azurerm_resource_group.rgname.name
  account_name          = data.azurerm_cosmosdb_account.cosmosdb.name
  database_name         = data.azurerm_cosmosdb_sql_database.sqldb.name
  partition_key_path    = try(each.value.partition_key_path,null)
  partition_key_version = try(each.value.partition_key_version,null)
#   throughput            = try(each.value.throughput,null)
  default_ttl = try(each.value.default_ttl,null)
#   analytical_storage_ttl = try(each.value.analytical_storage_ttl,null)
#   dynamic "autoscale_settings" {
#     for_each = try(each.value.autoscale_settings ,null) != null ? [each.value.autoscale_settings] : []
#     content {
#     max_throughput   =try(autoscale_settings.value.max_throughput,null)
#   }

  dynamic "indexing_policy" {
    for_each = try(each.value.indexing_policy ,null) != null ? [each.value.indexing_policy] :[]
    content {
    indexing_mode = try(indexing_policy.value.indexing_mode,null)
    dynamic "included_path" {
    for_each = try(each.value.included_path ,null) != null ? [each.value.included_path] :[]
    content {
      path = try(included_path.value.path,null)
    }
    }
   dynamic "excluded_path" {
    for_each = try(each.value.excluded_path ,null) != null ? [each.value.excluded_path] :[]
    content {
      path = try(excluded_path.value.path,null)
    }   
  }
    }
  }
  dynamic "unique_key" {
    for_each = try(each.value.unique_key ,null) != null ? [each.value.unique_key] :[]
    content {
      paths = try(unique_key.value.paths,null)
    } 
  }
    dynamic "conflict_resolution_policy" {
    for_each = try(each.value.conflict_resolution_policy ,null) != null ? [each.value.conflict_resolution_policy] :[]
    content {
      mode = try(conflict_resolution_policy.value.mode,null)
      conflict_resolution_path = try(conflict_resolution_policy.value.conflict_resolution_path,null)
    } 
  }
  depends_on = [ azurerm_cosmosdb_sql_database.sqldb ]
}