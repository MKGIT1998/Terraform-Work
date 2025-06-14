
resource "azurerm_databricks_workspace" "databricks" {
    for_each = var.databricks
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rgname.name
  location            = each.value.location
  sku                 = each.value.sku
  managed_resource_group_name = var.managed_resource_group_name
  public_network_access_enabled = try(each.value.public_network_access_enabled,null)
#   network_security_group_rules_required = try(each.value.network_security_group_rules_required,null)
  customer_managed_key_enabled = try(each.value.customer_managed_key_enabled,null)
infrastructure_encryption_enabled =try(each.value.infrastructure_encryption_enabled,null)

  custom_parameters {
    no_public_ip = try(each.value.no_public_ip,null)
    public_ip_name = try(each.value.public_ip_name ,null)
    nat_gateway_name = try(each.value.nat_gateway_name ,null)
    virtual_network_id = data.azurerm_virtual_network.vnet.id
    private_subnet_name = data.azurerm_subnet.publicsubnet.name
    public_subnet_name = data.azurerm_subnet.privatesubnet.name
    # public_subnet_network_security_group_association_id = data.azurerm_subnet.publicsubnet.network_security_group_id.id
    # private_subnet_network_security_group_association_id = data.azurerm_subnet.privatesubnet.network_security_group_id.id
    # storage_account_name = data.azurerm_storage_account.stccname.name
  }
  tags = try(each.value.tags , null)
# depends_on = [  ]
}
 