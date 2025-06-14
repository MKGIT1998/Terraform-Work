apim ={
    apim1 ={
    name="terraform-apim"
    location = "West Europe"
    publisher_name      = "Mahelaka"
    publisher_email     = "mahelaka.ahsan.khan@gmail.com" 
    sku_name = "Developer_1"
    #   public_ip_address_id = 
    public_network_access_enabled = true
    notification_sender_email = "apimgmt-noreply@mail.windowsazure.com"
    virtual_network_type = "External"
    virtual_network_configuration ={
        sub_id = "subnet1"
    }
    tags = {
      environment = "dev"
    }
#     hostname_configuration={
#         management= {
#      host_name = "management"
# #     certificate = 
# #     certificate_password = 
# #     key_vault_id = 
#     negotiate_client_certificate = false
# #     ssl_keyvault_identity_client_id = 

#     }
#         portal    = {
#      host_name = "portal"
# #     certificate = 
# #     certificate_password = 
# #     key_vault_id = 
#     negotiate_client_certificate = false
# #     ssl_keyvault_identity_client_id = 
#     }
#         developer_portal= {
#     host_name = "developer"
# #     certificate = 
# #     certificate_password = 
# #     key_vault_id = 
#     negotiate_client_certificate = false
# #     ssl_keyvault_identity_client_id = 
#     }
#         proxy= {
#     default_ssl_bindings = true
#       host_name = "proxy"
# #     certificate = 
# #     certificate_password = 
# #     key_vault_id = 
#     negotiate_client_certificate = false
# #     ssl_keyvault_identity_client_id = 
#     }
#         scm= {
#     host_name = "scm"
# #     certificate = 
# #     certificate_password = 
# #     key_vault_id = 
#     negotiate_client_certificate = false
# #     ssl_keyvault_identity_client_id = 
#     }
#     }
# additional_location= {
#     location =
#     capacity =
#     zones =
#     public_ip_address_id = 
#     }
# certificate = {  
#     encoded_certificate = 
#     store_name = 
#     certificate_password = 
# }
#   client_certificate_enabled = 
delegation= {
    user_registration_enabled = false
    subscriptions_enabled = false
    # url = 
    # validation_key =     
  }
  gateway_disabled =false
#   min_api_version = 
#   zones = 
identity= {
    type = "SystemAssigned"
    }

# policy= {
#         xml_content = 
#         xml_link = 
#         }
# proxy = {
#     default_ssl_bindings = true
#     host_name = 
#     certificate = 
#     certificate_password = 
#     key_vault_id = 
#     negotiate_client_certificate = false
#     ssl_keyvault_identity_client_id = 
#   }    
protocols = {
   enable_http2 = false
  }
security = {
   enable_backend_ssl30 = false
   enable_backend_tls11 = false
   enable_frontend_ssl30 =false 
   enable_frontend_tls11 = false
   enable_frontend_tls10 =false 
   enable_backend_tls10 = false
   tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = false
   tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled =false 
   tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled = false
   tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled =false 
   tls_rsa_with_aes128_cbc_sha256_ciphers_enabled = false
   tls_rsa_with_aes128_cbc_sha_ciphers_enabled =false 
   tls_rsa_with_aes128_gcm_sha256_ciphers_enabled =false 
   tls_rsa_with_aes256_cbc_sha256_ciphers_enabled = false 
   tls_rsa_with_aes256_cbc_sha_ciphers_enabled =  false
   tls_rsa_with_aes256_gcm_sha384_ciphers_enabled = false
   triple_des_ciphers_enabled =false
  }    
  }
# sign_in ={
#   enabled =false 
#   }
    
# sign_up={
#   enabled = false
#  terms_of_service={
#   consent_required =false 
#   enabled=false
# #   text = 
#     } 
#   }
# tenant_access ={
#   enabled =true
#   }
# terms_of_service={
#   consent_required =false
#   enabled= false
# #   text = 
#     } 
}
# developer_portal={
#     portal1={
#   apim_name = "apim1"
#   content={
# home-page = "<h1>Welcome to the Example API Management Developer Portal</h1>"
# }
#     }
#     }
users ={
    user1 ={
  user_id             = "testuser"
  apim_name = "apim1"
  first_name          = "test"
  last_name           = "user"
  email               = "test.user@accenture.com"
  state               = "active"
  confirmation        = "signup"
  password            = "Pass@123"
  note                = "Accept the invite and signp"
    }
}
group ={
    group1 ={
  name                = "group-01"
  apim_name = "apim1"
  display_name        = "terraform Group"
  description         =   "This is an API management group"   
#   external_id ="aad://<tenant id>/groups/<group object id>"
#   type ="custom"   
    }
}

identities ={
    identity1={
   apim_name = "apim1"
  client_id           = ""
  client_secret       = ""
  allowed_tenants     = [""]
#   signin_tenant     = 
    }
}

products ={
    product1 ={
  product_id            = "terraform-test-product"
  apim_name = "apim1"
  display_name          = "Test Product"
  subscription_required = true
  approval_required     = true
  published             = true
  subscriptions_limit   = 1
#   terms                 =  
    }
}
named_valued ={
    nv1 ={
  name                = "terraform-nv"
  apim_name = "apim1"
  display_name        = "Property"
  value               = "NValue"
  secret              = false
#   value_from_key_vault={
#      secret_id = 
#      identity_client_id =
#   }        
    }
}
apiname ={
    apiname1 ={
  name                = "terraform-api"
  apim_name = "apim1"
  revision =1
      
    }
}
apitags ={
    apitag1 ={
  name                = "terraform-apitags"
  appid ="apiname1"
      
    }
}
tags ={
    tag1 ={
  name                = "terraform-api"
  apim_id = "apim1"
      
    }
}
nsg ={
    nsg1={
        name ="terraform-apim-nsg"
        location = "West Europe"
    }
}
nsgrule ={
    rule1 ={
  name                        = "AllowApiVnetBound"
  priority                    = 106
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges      = ["3443"]
  source_address_prefix       = "ApiManagement"
  destination_address_prefix  = "VirtualNetwork"
  nsg_name  ="nsg1"
    }
     rule2 ={
  name                        = "AllowVnetOutBound"
  priority                    = 4094
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges      = ["*"]
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  nsg_name  ="nsg1"
    }
     rule3 ={
  name                        = "AllowInternetOutBound"
  priority                    = 4095
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges      = ["80","443"]
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Internet"
  nsg_name  ="nsg1"
    }
     rule4 ={
  name                        = "ACPS_Deny"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges      = ["*"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  nsg_name  ="nsg1"
    }
}
vnet ={
    vnet1={
        name ="terraform-apim-vnet"
        location = "West Europe"
        address_space       = ["10.0.0.0/16"]
        # dns_servers         = ["10.0.0.4","10.0.0.5"]
    }
}
subnet ={
    subnet1={
   name                 = "terraform-subnet1"
  vnet_name = "vnet1"
  address_prefixes     =  ["10.0.2.0/24"]  
    }
}
nsgsubnet ={
    association1 ={
        sub_id ="subnet1"
        nsg_id = "nsg1"
    }
}
adf= {
    adf1 = {
    name = "terraformtansition-etl-new"
    location = "West Europe"
    public_network_enabled =true
    type = "SystemAssigned, UserAssigned"
    identity_ids  =["/subscriptions//resourceGroups/rg-poc-terraform/providers/Microsoft.ManagedIdentity/userAssignedIdentities/terraformtansition-identity1", "/subscriptions//resourceGroups/rg-poc-terraform/providers/Microsoft.ManagedIdentity/userAssignedIdentities/terraformtansition-identity2"]
# customer_managed_key_id = "/subscriptions/your-subscription-id/resourceGroups/your-resource-group/providers/Microsoft.KeyVault/vaults/your-keyvault/keys/your-key"
# customer_managed_key_identity_id = "/subscriptions/your-subscription-id/resourceGroups/your-resource-group/providers/Microsoft.ManagedIdentity/userAssignedIdentities/your-identity"
      tags = {
      environment = "dev"
    }
  }

}
user_assigned_identity_name = {
  identity1 ={
        name = "terraformtansition-identity1"
    location = "West Europe"
  }
    identity2 ={
        name = "terraformtansition-identity2"
    location = "West Europe"
  }
}
managed_resource_group_name = "myDatabricksManagedResourceGroup"
databricks= {
    databricks1 = {
    name = "terraform-databricks-new"
    location = "West Europe"
    sku    = "standard"
    public_network_access_enabled = true
    # network_security_group_rules_required =false
    no_public_ip = false
    public_ip_name = "nat-gw-public-ip"
    nat_gateway_name = "nat-gateway"
    customer_managed_key_enabled = false
    infrastructure_encryption_enabled = false
    # default_storage_firewall_enabled = false
    # managed_disk_cmk_key_vault_key_id = 
    tags = {
      environment = "dev"
    }

  }

}
eventhubs = {
    eventhubs1 ={
    name                = "terraform-eventhub1"
    namespace      = "namespaces3"
    partition_count     = 4
    message_retention   = 7
    status = "Active"
capture_description= {    
    enabled =true
    encoding = "Avro"
    interval_in_seconds = 300
    size_limit_in_bytes = 314572800
    skip_empty_archives = false
    destination ={
    name = "EventHubArchive.AzureBlockBlob"
    # archive_name_format = "terraform-namespaces/terraform-eventhub1/4/2024/06/04/14/30/15" 
    archive_name_format ="{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second} "       
    }
}

}
    eventhubs2 ={
    name                = "terraform-eventhub2"
    namespace      = "namespaces4"
    partition_count     = 4
    message_retention   = 7
    status = "Active"
capture_description= {    
    enabled =true
    encoding = "Avro"
    interval_in_seconds = 300
    size_limit_in_bytes = 314572800
    skip_empty_archives = false
    destination ={
    name = "EventHubArchive.AzureBlockBlob"
    # archive_name_format = "terraform-namespaces/terraform-eventhub1/4/2024/06/04/14/30/15" 
    archive_name_format ="{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second} "       
    }
}

}
    eventhubs3 ={
    name                = "terraform-eventhub3"
    namespace      = "namespaces4"
    partition_count     = 4
    message_retention   = 7
    status = "Active"
capture_description= {    
    enabled =true
    encoding = "Avro"
    interval_in_seconds = 300
    size_limit_in_bytes = 314572800
    skip_empty_archives = false
    destination ={
    name = "EventHubArchive.AzureBlockBlob"
    # archive_name_format = "terraform-namespaces/terraform-eventhub1/4/2024/06/04/14/30/15" 
    archive_name_format ="{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second} "       
    }
}

}
    eventhubs4 ={
    name                = "terraform-eventhub4"
    namespace      = "namespaces4"
    partition_count     = 4
    message_retention   = 7
    status = "Active"
capture_description= {    
    enabled =true
    encoding = "Avro"
    interval_in_seconds = 300
    size_limit_in_bytes = 314572800
    skip_empty_archives = false
    destination ={
    name = "EventHubArchive.AzureBlockBlob"
    # archive_name_format = "terraform-namespaces/terraform-eventhub1/4/2024/06/04/14/30/15" 
    archive_name_format ="{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second} "       
    }
}

}
}
namespaces = {
    namespaces3 ={
    name                = "terraform-namespaces3"
    location            = "West Europe"
    sku                 = "Standard"
    capacity            = 2
    auto_inflate_enabled = false
    # dedicated_cluster_id = 
    maximum_throughput_units = 0
    zone_redundant = false
    local_authentication_enabled = true
    public_network_access_enabled = true
    minimum_tls_version = 1.2
    tags = {
      environment = "dev"
    }
    identity={
    type= "SystemAssigned"
    } 
    network_rulesets={
    default_action = "Deny"
    public_network_access_enabled = true
    trusted_service_access_enabled = false
    virtual_network_rule = {
    ignore_missing_vnet_service_endpoint =false
    
}
    ip_rule={
        ip_mask ="203.192.225.138"
        action = "Allow"
    }
    }

    }
    namespaces4 ={
    name                = "terraform-namespaces4"
    location            = "West Europe"
    sku                 = "Standard"
    capacity            = 2
    auto_inflate_enabled = false
    # dedicated_cluster_id = 
    maximum_throughput_units = 0
    zone_redundant = false
    local_authentication_enabled = true
    public_network_access_enabled = true
    minimum_tls_version = 1.2
    tags = {
      environment = "dev"
    }
    identity={
    type= "SystemAssigned"
    } 
    network_rulesets={
    default_action = "Deny"
    public_network_access_enabled = true
    trusted_service_access_enabled = false
    virtual_network_rule = {
    ignore_missing_vnet_service_endpoint =false
    
}
    ip_rule={
        ip_mask ="203.192.225.138"
        action = "Allow"
    }
    }


    }
}
# authorization ={
#   authrule1={
#   name                = "terraform-authrule1"
#   namespace      = "namespaces1"
#   eventhub       = "eventhubs1"
#   listen              = true
#   send                = false
#   manage              = false
#   }
#     authrule2={
#   name                = "terraform-authrule2"
#   namespace      = "namespaces1"
#   eventhub       = "eventhubs2"
#   listen              = true
#   send                = false
#   manage              = false
#   }
#       authrule3={
#   name                = "terraform-authrule2"
#   namespace      = "namespaces2"
#   eventhub       = "eventhubs3"
#   listen              = true
#   send                = false
#   manage              = false
#   }
#       authrule4={
#   name                = "terraform-authrule2"
#   namespace      = "namespaces2"
#   eventhub       = "eventhubs4"
#   listen              = true
#   send                = false
#   manage              = false
#   }
# }
consumer_group = {
    consumer1={
  name                = "terraform-consumer1"
  namespace     = "namespaces3"
  eventhub      = "eventhubs1"
  user_metadata       = "User Metadata goes here"
    }
        consumer2={
  name                = "terraform-consumer2"
  namespace     = "namespaces3"
  eventhub      = "eventhubs2"
  user_metadata       = "User Metadata goes here"
    }
        consumer3={
  name                = "terraform-consumer3"
  namespace     = "namespaces4"
  eventhub      = "eventhubs3"
  user_metadata       = "User Metadata goes here"
    }
    consumer4={
  name                = "terraform-consumer4"
  namespace     = "namespaces4"
  eventhub      = "eventhubs3"
  user_metadata       = "User Metadata goes here"
    }
     consumer5={
  name                = "terraform-consumer4"
  namespace     = "namespaces4"
  eventhub      = "eventhubs4"
  user_metadata       = "User Metadata goes here"
    }
}
location = "West Europe"
cosmosdb = {
    cosmosdb1 ={
    name = "terraform-cosmosdb-sql-1"
    offer_type = "Standard"
    # kind = "GlobalDocumentDB"
    tags = {
      environment = "dev"
    }
    minimal_tls_version = "Tls12"
    default_identity_type = "FirstPartyIdentity"
    free_tier_enabled    = false
    ip_range_filter ="203.192.225.219"
    analytical_storage_enabled = false
    automatic_failover_enabled = true
    public_network_access_enabled = true
    partition_merge_enabled = false
    is_virtual_network_filter_enabled = true
    # create_mode = "Default"
    # key_vault_key_id = try(each.value.key_vault_key_id,null)
    multiple_write_locations_enabled = false
    access_key_metadata_writes_enabled =true
    network_acl_bypass_for_azure_services = false
    local_authentication_disabled = false

consistency_policy ={
    consistency_level = "Session"
    max_interval_in_seconds = "5"
    max_staleness_prefix ="100"
}
capabilities ={
    name="EnableServerless"        
}

identity ={
    type= "SystemAssigned"
    }
geo_location ={
    location = "West Europe"
    failover_priority = 0
    zone_redundant = false
}
virtual_network_rule = {
    ignore_missing_vnet_service_endpoint =false
    
}
backup ={
    type ="Periodic"
    # tier ="Continuous30Days"
     interval_in_minutes= 240
    retention_in_hours= 8
    storage_redundancy= "Geo"
}
}

}

sqldb ={
  sqldb1  ={
    name = "terraform-sqldb-1"
    # throughput = 400
    # autoscale_settings ={
    # max_throughput = 1000
    # }
  }
}
sqlcontainer ={
    sqlcontainer1 ={
  name = "terraform-sqldbcontainer-1"
  db_name = "terraform-sqldb-1"        
  partition_key_path    = "/definition/id"
  partition_key_version = 2
#   throughput            = 400
    # autoscale_settings ={
    # max_throughput = 1000
    # }
  default_ttl = -1
#   analytical_storage_ttl = -1
  indexing_policy= {
    indexing_mode = "consistent"
    included_path= {
      path = "/*"
    }
    excluded_path= {
      path = "/excluded/?"
    }
  }

  unique_key ={
    paths = ["/definition/idlong", "/definition/idshort"]
  }
  conflictResolutionPolicy ={
    mode= "LastWriterWins"
    conflictResolutionPath= "/_ts"
 }
}

    }

sql_server_configurations = {
  sql-server-1 = {
    name                = "sqlserver-terraform-1"
    location            = "West Europe"
    version             = "12.0"
    minimum_tls_version = "1.2"
    admin_login         = "admin1"
    admin_password      = "G!P(DzasBKZx&bp-8*;uwQ"
    connection_policy   = "Default"
    public_network_access_enabled = true
    outbound_network_restriction_enabled = false
    tags = {
      environment = "dev"
    }
  }
  sql-server-2 = {
    name                = "sqlserver-terraform-2"
    location            = "West Europe"
    version             = "12.0"
    minimum_tls_version = "1.2"
    admin_login         = "admin2"
    admin_password      = "m8p6u`M!J-fHjB=X[yC>hG"
    connection_policy   = "Default"
    public_network_access_enabled = true
    outbound_network_restriction_enabled = false
    tags = {
      environment = "dev"
    }
  }
}
sql_db_name = {
  sql_db-1 ={
  name  = "sql-db-terraform-1"
  server_id_key = "sql-server-1"
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  create_mode = "Default"
  max_size_gb   = 250
  min_capacity  = 5
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  enclave_type   = "Default"
  geo_backup_enabled = true
  # storage_account_type = "Local"
  maintenance_configuration_name ="SQL_Default"
  ledger_enabled = false
  sample_name = "AdventureWorksLT"
  transparent_data_encryption_enabled = true
  secondary_type = "Geo"
  short_term_retention_policy={
      retention_days = 7
  }
  long_term_retention_policy={
  week_of_year = 1
  monthly_retention = "P1M"
  yearly_retention = "P1Y"
  weekly_retention = "P1W"
  }
  tags = {
      environment = "dev"
    }
}

  sql_db-2 ={
  name  = "sql-db-terraform-2"
  server_id_key = "sql-server-2"
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  create_mode    ="Default"
  max_size_gb   =  250
  min_capacity  = 5
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  enclave_type   = "Default"
  geo_backup_enabled = true
  maintenance_configuration_name ="SQL_Default"
  ledger_enabled = false
  transparent_data_encryption_enabled = true
  sample_name = "AdventureWorksLT"
  secondary_type = "Geo"
  retention_days = 7
  week_of_year = 1
  monthly_retention = "P1M"
  yearly_retention = "P1Y"
  weekly_retention = "P1W"
  tags = {
      environment = "dev"
    }
  }
}
sql_firewall_rules = {
  rule1 = {
    name = "rule1"
    server_id_key = "sql-server-1"
    start_ip_address  = "10.0.0.1"
    end_ip_address    = "10.0.0.1"
    # Add more configuration parameters for rule1 if needed
  }
    rule2 = {
    name = "rule2"
    server_id_key = "sql-server-1"
    start_ip_address  = "10.0.1.1"
    end_ip_address    = "10.0.1.1"
  }
  rule3 = {
    name = "rule3"
    server_id_key = "sql-server-2"
    start_ip_address  = "10.0.0.20"
    end_ip_address    = "10.0.0.20"
  }
  # Add more firewall rules as needed
}
vnet_rule = {
    vnet-rule1 = {
    server_id_key = "sql-server-1"
  }
      vnet-rule2 = {
    server_id_key = "sql-server-2"
  }
}

cosmos_db = {
    cosmos_db1 ={
    name = "terraform-cosmosmongodb"
    offer_type = "Standard"
    kind = "MongoDB"
    tags = {
      environment = "dev"
    }
    minimal_tls_version = "Tls12"
    default_identity_type = "FirstPartyIdentity"
    free_tier_enabled    = false
    ip_range_filter = "203.192.225.219"
    analytical_storage_enabled = false
    automatic_failover_enabled = true
    public_network_access_enabled = true
    partition_merge_enabled = false
    is_virtual_network_filter_enabled = true
    # create_mode = "Default"
    # key_vault_key_id = try(each.value.key_vault_key_id,null)
    multiple_write_locations_enabled = false
    access_key_metadata_writes_enabled =true
    mongo_server_version = 4.2
    network_acl_bypass_for_azure_services = false
    local_authentication_disabled = false

consistency_policy ={
    consistency_level = "Session"
    max_interval_in_seconds = "5"
    max_staleness_prefix ="100"
}
capabilities ={
    name ="EnableServerless"
}
                
identity ={
    type= "SystemAssigned"
    }
geo_location ={
    location = "West Europe"
    failover_priority = 0
    zone_redundant = false
}
virtual_network_rule = {
    ignore_missing_vnet_service_endpoint =false
    
}
backup ={
    type ="Periodic"
    # tier ="Continuous30Days"
     interval_in_minutes= 240
    retention_in_hours= 8
    storage_redundancy= "Geo"
}
}

}
mongodb ={
  mongodb1  ={
    name = "terraform-mongodb"
    # throughput = 400
    # autoscale_settings ={
    # max_throughput = 1000
    # }
  }
}
new_collection = {
    collection1={
    name = "mongocollection-01"
    default_ttl_seconds = 777
    shared_key           = "uniqueKey"
    # throughput          = 400 
        # autoscale_settings ={
    # max_throughput = 1000
    # }
    #   analytical_storage_ttl = -1

    index ={
    keys   = ["_id"]
    unique = true
    }       
    }
}
