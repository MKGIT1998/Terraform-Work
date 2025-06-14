resource "azurerm_cosmosdb_account" "cosmos_db" {
    for_each = var.cosmos_db
  name                = try(each.value.name,null)
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rgname.name
  offer_type          = try(each.value.offer_type,null)
  kind                = try(each.value.kind,null)
  tags                = try(each.value.tags,null)
  minimal_tls_version = try(each.value.minimal_tls_version,null)
  default_identity_type = try(each.value.default_identity_type,null)
  ip_range_filter = try(each.value.ip_range_filter,null)
  free_tier_enabled    = try(each.value.free_tier_enabled,null)
#   create_mode = try(each.value.create_mode,null)
#   analytical_storage_enabled = try(each.value.analytical_storage_enabled,null)
  automatic_failover_enabled = try(each.value.automatic_failover_enabled,null)
  public_network_access_enabled = try(each.value.public_network_access_enabled,null)
  partition_merge_enabled = try(each.value.partition_merge_enabled,null)
  is_virtual_network_filter_enabled = try(each.value.is_virtual_network_filter_enabled,null)
#   key_vault_key_id = try(each.value.key_vault_key_id,null)
  multiple_write_locations_enabled = try(each.value.multiple_write_locations_enabled,null)
  access_key_metadata_writes_enabled = try(each.value.access_key_metadata_writes_enabled,null)
  mongo_server_version = try(each.value.mongo_server_version,null)
  network_acl_bypass_for_azure_services = try(each.value.network_acl_bypass_for_azure_services,null)
  local_authentication_disabled = try(each.value.local_authentication_disabled,null)

  dynamic "capabilities" {
    for_each = try(each.value.capabilities ,null) != null ? [each.value.capabilities] : []
content {
    name =try(capabilities.value.name,null)

}
  
  }
# capabilities {
#   name = each.value.capabilities.name
# }
  dynamic "consistency_policy" {
    for_each = try(each.value.consistency_policy ,null) != null ? [each.value.consistency_policy] : []
content {
    consistency_level       = try(consistency_policy.value.consistency_level,null)
    max_interval_in_seconds = try(consistency_policy.value.max_interval_in_seconds,null)
    max_staleness_prefix    = try(consistency_policy.value.max_staleness_prefix,null)
}
  }
    dynamic "identity" {
    for_each = try(each.value.identity ,null) != null ? [each.value.identity] : []
    content {
      identity_ids = try(identity.value.identity_ids , null) 
      type = try(identity.value.type , null)
    }
  }

  dynamic "geo_location" {
    for_each = try(each.value.geo_location ,null) != null ? [each.value.geo_location] : []
    content{
    location          = try(geo_location.value.location ,null)
    failover_priority = try(geo_location.value.failover_priority,null)
    zone_redundant = try(geo_location.value.zone_redundant ,null)
    }
  }

    dynamic "virtual_network_rule" {
    for_each = try(each.value.virtual_network_rule ,null) != null ? [each.value.virtual_network_rule] : []
    content {
      id = data.azurerm_subnet.subnet.id
      ignore_missing_vnet_service_endpoint = try(virtual_network_rule.value.ignore_missing_vnet_service_endpoint , null)
    }
  }
    dynamic "backup" {
    for_each = try(each.value.backup ,null) != null ? [each.value.backup] : []
    content {
    type = try(backup.value.type ,null)
    # tier = try(backup.value.tier ,null)
    interval_in_minutes = try(backup.value.interval_in_minutes ,null)
    retention_in_hours = try(backup.value.retention_in_hours ,null)
    storage_redundancy = try(backup.value.storage_redundancy ,null)
    }
  }

 
}
