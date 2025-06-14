data "azurerm_resource_group" "rgname" {
  name= "rg-poc-terraform"    
  
}
data "azurerm_virtual_network" "vnet"{
  name ="vnet-netzero-terraform1"
  resource_group_name = "rg-poc-terraform"

}
data "azurerm_subnet" "subnet"{
  name = "snet-dbw-public-terraform"
  virtual_network_name = "vnet-netzero-terraform1"
  resource_group_name = "rg-poc-terraform"
}
# data "azurerm_key_vault" "keyvault" {
#   name = ""
#   resource_group_name = "rg-poc-terraform"
# }