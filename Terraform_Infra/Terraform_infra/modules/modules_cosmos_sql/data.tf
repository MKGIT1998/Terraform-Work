data "azurerm_resource_group" "rgname" {
  name= "rg-poc-terraform"    
  
}
data "azurerm_cosmosdb_account" "cosmosdb" {
  name = "netzero-cosmosdb-sql-1"
  resource_group_name = "rg-poc-terraform"
  
}
data "azurerm_cosmosdb_sql_database" "sqldb" {
 account_name= "netzero-cosmosdb-sql-1"
 name = "netzero-sqldb-1"
  resource_group_name = "rg-poc-terraform"
}
