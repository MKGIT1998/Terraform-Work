resource "azurerm_data_factory" "adf" {
for_each = var.adf
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rgname.name
  location            = each.value.location
  public_network_enabled = try(each.value.public_network_enabled , null)
  # customer_managed_key_id = data.azurerm_key_vault.keyvault.id
  # customer_managed_key_identity_id = each.value.customer_managed_key_vaul
  identity {
    type = each.value.type
    identity_ids = try(each.value.identity_ids,null)
  }
  tags = try(each.value.tags , null)
depends_on = [ azurerm_user_assigned_identity.user_assigned_identity_name ]
}
resource "azurerm_user_assigned_identity" "user_assigned_identity_name" {
  for_each = var.user_assigned_identity_name
  location            = each.value.location
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rgname.name
}
