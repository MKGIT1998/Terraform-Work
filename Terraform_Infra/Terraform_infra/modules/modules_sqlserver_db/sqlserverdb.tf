resource "azurerm_mssql_server" "sql_servers" {
  for_each = var.sql_server_configurations
  name                         = try(each.value.name ,null)
  resource_group_name          = data.azurerm_resource_group.rgname.name
  location                     = try(each.value.location,null)
  version                      = try(each.value.version,null) # SQL Server version
  administrator_login          = try(each.value.admin_login,null)
  administrator_login_password = try(each.value.admin_password,null)
  minimum_tls_version = try(each.value.minimum_tls_version,null)
  connection_policy = try(each.value.connection_policy,null)
  public_network_access_enabled =try( each.value.public_network_access_enabled,null)
  outbound_network_restriction_enabled = try(each.value.outbound_network_restriction_enabled ,null)
  tags = try(each.value.tags,null)
}
resource "azurerm_mssql_database" "sql_db" {
  for_each = var.sql_db_name
  name                = try(each.value.name,null)
  server_id        = azurerm_mssql_server.sql_servers[each.value.server_id_key].id
  sku_name = try(each.value.sku_name,null)
  collation = try(each.value.collation ,null)
  max_size_gb  = try(each.value.max_size_gb ,null)
  # min_capacity = try(each.value.min_capacity ,null)
  create_mode = try(each.value.create_mode ,null)
  read_scale     = try(each.value.read_scale,null)
  zone_redundant = try(each.value.zone_redundant ,null)
  enclave_type   = try(each.value.enclave_type,null)
  geo_backup_enabled = try(each.value.geo_backup_enabled,null)
  maintenance_configuration_name = try(each.value.maintenance_configuration_name,null)
  ledger_enabled = try(each.value.ledger_enabled,null)
  sample_name = try(each.value.sample_name,null)
  secondary_type = try(each.value.secondary_type,null)
  transparent_data_encryption_enabled = try(each.value.transparent_data_encryption_enabled,null)
  tags = try(each.value.tags , null)
  dynamic "short_term_retention_policy" {
  for_each = try(each.value.short_term_retention_policy ,null) != null ? [each.value.short_term_retention_policy] : []
content {
    retention_days = try(short_term_retention_policy.value.retention_days , null)
  }
  }
  dynamic  "long_term_retention_policy" {
      for_each = try(each.value.long_term_retention_policy ,null) != null ? [each.value.long_term_retention_policy] : []
content {
    weekly_retention  = try(long_term_retention_policy.value.weekly_retention , null)
    monthly_retention = try(long_term_retention_policy.value.monthly_retention , null)
    yearly_retention  = try(long_term_retention_policy.value.yearly_retention , null)
    week_of_year      = try(long_term_retention_policy.value.week_of_year, null)
  }
  }
  lifecycle {
    prevent_destroy = true
  }

  depends_on = [ azurerm_mssql_server.sql_servers]

}
resource "azurerm_mssql_virtual_network_rule" "vnet_rule" {
for_each = var.vnet_rule
  name      = data.azurerm_virtual_network.vnet.name
  server_id        = azurerm_mssql_server.sql_servers[each.value.server_id_key].id
  subnet_id = data.azurerm_subnet.subnet.id
  depends_on = [ azurerm_mssql_server.sql_servers ]
}

resource "azurerm_mssql_firewall_rule" "sql_firewall_rules" {
  for_each = var.sql_firewall_rules
  
  name                = try(each.value.name ,null)
  server_id           = azurerm_mssql_server.sql_servers[each.value.server_id_key].id
  start_ip_address    = try(each.value.start_ip_address,null)
  end_ip_address      = try(each.value.end_ip_address,null)
  depends_on = [ azurerm_mssql_server.sql_servers]
}
