resource "azurerm_data_factory" "adf" {
  for_each = var.adf

  name                = each.value.name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.rg_name.resource_group_name
  public_network_enabled =try(each.value.public_network_enabled,null)
}
