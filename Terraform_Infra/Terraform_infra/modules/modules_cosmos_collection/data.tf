data "azurerm_resource_group" "rgname" {
  name= "rg-poc-terraform"    
  
}
data "azurerm_cosmosdb_account" "cosmosdb" {
  name = "netzero-cosmosmongodb"
  resource_group_name = "rg-poc-terraform"
}
data "azurerm_cosmosdb_mongo_database" "mongodb"{
  name = "netzero-mongodb"
  account_name = "netzero-cosmosmongodb"
  resource_group_name = "rg-poc-terraform"
}