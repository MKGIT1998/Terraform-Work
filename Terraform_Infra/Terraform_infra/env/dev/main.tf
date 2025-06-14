module "apim" {
  source = "../../modules/modules_apim"
  apim = var.apim
  group = var.group
  users =var.users
  identities =var.identities
  products = var.products
  named_valued = var.named_valued
  apiname = var.apiname
  tags = var.tags
  apitags = var.apitags
  nsg = var.nsg
  vnet = var.vnet
  subnet =var.subnet
  nsgsubnet =var.nsgsubnet
  nsgrule = var.nsgrule
}
module "adf"{
source ="../../modules/modules_adf"
adf = var.adf
user_assigned_identity_name = var.user_assigned_identity_name

}
module "cosmos_sql"{
source ="../../modules/modules_cosmos_sql"
   sqldb = var.sqldb
   sqlcontainer = var.sqlcontainer
   depends_on =[module.cosmos_sql_server]
}
module "cosmos_sql_server"{
source ="../../modules/modules_cosmos_sql_server"
  cosmosdb = var.cosmosdb
  location = var.location
}

module "databricks"{
source ="../../modules/modules_databricks"
  databricks = var.databricks
  managed_resource_group_name = var.managed_resource_group_name
}
// module "eventhubs"{
// source ="../../modules/modules_eventhubs"
//   eventhubs = var.eventhubs
//   namespaces = var.namespaces
//   consumer_group = var.consumer_group
// }
module "sqlserver_db"{
source ="../../modules/modules_sqlserver_db"
  sql_server_configurations = var.sql_server_configurations
  sql_firewall_rules = var.sql_firewall_rules
  sql_db_name = var.sql_db_name
  vnet_rule = var.vnet_rule
}
module "cosmos_db" {
  source = "../../modules/modules_cosmos_db"
  cosmos_db = var.cosmos_db
  location = var.location
}
module "mongodb" {
  source = "../../modules/modules_cosmos_mongo_db"
  mongodb = var.mongodb 
  depends_on =[module.cosmos_db]
}
module "new_collection" {
  source = "../../modules/modules_cosmos_collection"
  new_collection = var.new_collection
  depends_on = [ module.mongodb ]
}
