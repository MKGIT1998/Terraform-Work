resource "azurerm_eventhub_namespace" "namespaces" {
    for_each = var.namespaces
  name                = try(each.value.name ,null)
  location            = try(each.value.location ,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  sku                 = try(each.value.sku ,null)
  capacity            = try(each.value.capacity ,null)
  auto_inflate_enabled = try(each.value.auto_inflate_enabled ,null)
#   dedicated_cluster_id = try(each.value.dedicated_cluster_id ,null)
  maximum_throughput_units = try(each.value.maximum_throughput_units ,null)
  zone_redundant = try(each.value.zone_redundant ,null)
  local_authentication_enabled = try(each.value.local_authentication_enabled ,null)
  public_network_access_enabled = try(each.value.public_network_access_enabled ,null)
  minimum_tls_version = try(each.value.minimum_tls_version,null)
  tags = try(each.value.tags ,null)
  dynamic "identity" {
    for_each = try(each.value.identity ,null) != null ? [each.value.identity] : []
    content {
    identity_ids =try(identity.value.identity_ids , null) 
    type = try(identity.value.type , null)
    }
  }
    dynamic "network_rulesets" {
    for_each = try(each.value.network_rulesets ,null) != null ? [each.value.network_rulesets] : []
    content {
    default_action =try(network_rulesets.value.default_action , null) 
    public_network_access_enabled = try(network_rulesets.value.public_network_access_enabled,null)
    trusted_service_access_enabled = try(network_rulesets.value.trusted_service_access_enabled,null)
    dynamic "virtual_network_rule" {
    for_each = try(network_rulesets.value.virtual_network_rule ,null) != null ? [network_rulesets.value.virtual_network_rule] : []
    content {
    subnet_id = data.azurerm_subnet.subnet.id
    ignore_missing_virtual_network_service_endpoint = try(virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint,null)
    }
    }
    dynamic "ip_rule" {
    for_each = try(network_rulesets.value.ip_rule ,null) != null ? [network_rulesets.value.ip_rule] : []
    content {  
        ip_mask = try(ip_rule.value.ip_mask,null)
        action = try(ip_rule.value.action ,null)
    }
    }
  }
}
}
resource "azurerm_eventhub" "eventhubs" {
    for_each = var.eventhubs
  name                = try(each.value.name ,null)
  namespace_name      = azurerm_eventhub_namespace.namespaces[each.value.namespace].name
  resource_group_name = data.azurerm_resource_group.rgname.name
  partition_count     = try(each.value.partition_count ,null)
  message_retention   = try(each.value.message_retention ,null)
  status = try(each.value.status ,null)

  dynamic "capture_description" {
    for_each = try(each.value.capture_description ,null) != null ? [each.value.capture_description] : []
    content {
    enabled = try(capture_description.value.enabled ,null)
    encoding = try(capture_description.value.encoding ,null)
    interval_in_seconds = try(capture_description.value.interval_in_seconds ,null)
    size_limit_in_bytes = try(capture_description.value.size_limit_in_bytes ,null)
    skip_empty_archives = try(capture_description.value.skip_empty_archives,null)
    dynamic "destination" {
    for_each = try(capture_description.value.destination ,null) != null ? [capture_description.value.destination] : []
    content {
    name = try(destination.value.name,null)
    archive_name_format = try(destination.value.archive_name_format,null)
    // storage_account_id =data.azurerm_storage_account.storageaccount.id
    // blob_container_name =data.azurerm_storage_container.container.name
      }
    }
  }
}
depends_on = [ azurerm_eventhub_namespace.namespaces ]
}
# resource "azurerm_eventhub_authorization_rule" "authorization" {
#     for_each = var.authorization
#   name                = try(each.value.name,null)
#   namespace_name      = azurerm_eventhub_namespace.namespaces[each.value.namespace].name
#   eventhub_name       = azurerm_eventhub.eventhubs[each.value.eventhub].name
#   resource_group_name = data.azurerm_resource_group.rgname.name
#   listen              = try(each.value.listen,null)
#   send                = try(each.value.send,null)
#   manage              = try(each.value.manage,null)
# }
resource "azurerm_eventhub_consumer_group" "consumer_group" {
    for_each = var.consumer_group
  name                = try(each.value.name,null)
  namespace_name      = azurerm_eventhub_namespace.namespaces[each.value.namespace].name
  eventhub_name       = azurerm_eventhub.eventhubs[each.value.eventhub].name
  resource_group_name = data.azurerm_resource_group.rgname.name
  user_metadata       = try(each.value.user_metadata,null)
  depends_on = [ azurerm_eventhub.eventhubs , azurerm_eventhub_namespace.namespaces ]
}