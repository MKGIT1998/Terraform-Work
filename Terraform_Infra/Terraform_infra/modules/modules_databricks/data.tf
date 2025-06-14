data "azurerm_resource_group" "rgname" {
  name= "rg-poc-terraform"    
  
}
# data "azurerm_storage_account" "stccname" {
#   name= "priyankastorageaccount1"    
#   resource_group_name = "rg-poc-terraform"
# }
data "azurerm_virtual_network" "vnet"{
  name ="vnet-netzero-terraform1"
  resource_group_name = "rg-poc-terraform"
 
}
data "azurerm_subnet" "publicsubnet"{
  name = "snet-dbw-public-terraform"
  virtual_network_name = "vnet-netzero-terraform1"
  resource_group_name = "rg-poc-terraform"
}
data "azurerm_subnet" "privatesubnet"{
  name = "snet-dbw-private-terraform"
  virtual_network_name = "vnet-netzero-terraform2"
  resource_group_name = "rg-poc-terraform"
}
data "azurerm_network_security_group" "public-Nsg_association" {
  name                = "nsg2"
  resource_group_name = "rg-poc-terraform"
}
