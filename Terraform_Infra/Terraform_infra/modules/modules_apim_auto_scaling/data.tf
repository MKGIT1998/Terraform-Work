data "azurerm_resource_group" "rgname" {
  name= "rg-poc-terraform"    
  
}
data "azurerm_api_management" "apim"{
       name ="netzero-apim"
       resource_group_name = "rg-poc-terraform"
}