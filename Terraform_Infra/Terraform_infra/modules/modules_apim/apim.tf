resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg
  name                = try(each.value.name ,null)
  location            = try(each.value.location ,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
}
resource "azurerm_network_security_rule" "nsgrule" {
  for_each =var.nsgrule
    name                       = try(each.value.name ,null)
    priority                   = try(each.value.priority ,null)
    direction                  = try(each.value.direction ,null)
    access                     = try(each.value.access ,null)
    protocol                   = try(each.value.protocol ,null)
    source_port_range          = try(each.value.source_port_range ,null)
    destination_port_ranges     = try(each.value.destination_port_ranges ,null)
    source_address_prefix      = try(each.value.source_address_prefix ,null)
    destination_address_prefix = try(each.value.destination_address_prefix ,null)
    resource_group_name         = data.azurerm_resource_group.rgname.name
    network_security_group_name = azurerm_network_security_group.nsg[each.value.nsg_name].name
}

resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnet
  name                = try(each.value.name ,null)
  location            = try(each.value.location ,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  address_space       = try(each.value.address_space ,null)
  # dns_servers         = try(each.value.dns_servers ,null)

#   subnet {
#     name           = "subnet1"
#     address_prefix = "10.0.1.0/24"
#   

  tags =try(each.value.tags,null)
}
resource "azurerm_subnet" "subnet" {
  for_each = var.subnet
  name                 = try(each.value.name,null)
  resource_group_name  = data.azurerm_resource_group.rgname.name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_name].name
  address_prefixes     =  try(each.value.address_prefixes,null) 
  depends_on =[azurerm_virtual_network.vnet]
}
resource "azurerm_subnet_network_security_group_association" "nsgsubnet" {
  for_each = var.nsgsubnet
  subnet_id                 = azurerm_subnet.subnet[each.value.sub_id].id
  network_security_group_id = azurerm_network_security_group.nsg[each.value.nsg_id].id
}
resource "azurerm_api_management" "apim" {
    for_each = var.apim
  name                = try(each.value.name,null)
  location            = try(each.value.location,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  publisher_name      = try(each.value.publisher_name,null)
  publisher_email     = try(each.value.publisher_email,null)

  sku_name = try(each.value.sku_name,null)
  dynamic "additional_location" {
  for_each = try(each.value.additional_location ,null) != null ? [each.value.additional_location] : []
content {
    location =try(additional_location.value.location,null)
    capacity =try(additional_location.value.capacity,null)
    zones =try(additional_location.value.zones,null)
    public_ip_address_id = try(additional_location.value.public_ip_address)
  }
  }
  dynamic "certificate" {
  for_each = try(each.value.certificate,null) != null ? [each.value.certificate] : []
content {   
    encoded_certificate = try(certificate.value.encoded_certificate ,null)
    store_name = try(certificate.value.store_name ,null)
    certificate_password = try(certificate.value.certificate_password ,null)
}
  }
  client_certificate_enabled = try(each.value.client_certificate_enabled,null)
  dynamic "delegation" {
  for_each = try(each.value.delegation ,null) != null ? [each.value.delegation] : []
content { 
    user_registration_enabled = try(delegation.value.user_registration_enabled,null)
    subscriptions_enabled = try(delegation.value.subscriptions_enabled,null)
    url = try(delegation.value.url,null)
    validation_key =try(delegation.value.validation_key,null)     
  }
  }
  gateway_disabled = try(each.value.gateway_disabled,null)
  min_api_version = try(each.value.min_api_version,null)
  zones = try(each.value.zones,null)
    dynamic "identity" {
    for_each = try(each.value.identity ,null) != null ? [each.value.identity] : []
    content {
      identity_ids = try(identity.value.identity_ids , null) 
      type = try(identity.value.type , null)
    }
  }
  dynamic "hostname_configuration" {
    for_each = try(each.value.hostname_configuration ,null) != null ? [each.value.hostname_configuration] : []
    content { 
dynamic "management" {
          for_each = try(hostname_configuration.value.management ,null) != null ? [hostname_configuration.value.management] : []   
    content{ 
    host_name = try(management.value.host_name ,null)
    certificate = try(management.value.certificate ,null)
    certificate_password = try(management.value.certificate_password ,null)
    key_vault_id = try(management.value.key_vault_id ,null)
    negotiate_client_certificate = try(management.value.negotiate_client_certificate,null)
    ssl_keyvault_identity_client_id = try(management.value.ssl_keyvault_identity_client_id,null)
  } 
}
dynamic "portal" {
          for_each = try(hostname_configuration.value.portal ,null) != null ? [hostname_configuration.value.portal] : []   
    content{ 
    host_name = try(portal.value.host_name ,null)
    certificate = try(portal.value.certificate ,null)
    certificate_password = try(portal.value.certificate_password ,null)
    key_vault_id = try(portal.value.key_vault_id ,null)
    negotiate_client_certificate = try(portal.value.negotiate_client_certificate,null)
    ssl_keyvault_identity_client_id = try(portal.value.ssl_keyvault_identity_client_id,null)
  } 
}
dynamic "developer_portal" {
          for_each = try(hostname_configuration.value.developer_portal ,null) != null ? [hostname_configuration.value.developer_portal] : []   
    content{ 
    host_name = try(developer_portal.value.host_name ,null)
    certificate = try(developer_portal.value.certificate ,null)
    certificate_password = try(developer_portal.value.certificate_password ,null)
    key_vault_id = try(developer_portal.value.key_vault_id ,null)
    negotiate_client_certificate = try(developer_portal.value.negotiate_client_certificate,null)
    ssl_keyvault_identity_client_id = try(developer_portal.value.ssl_keyvault_identity_client_id,null)
  } 
}
dynamic "proxy" {
         for_each = try(hostname_configuration.value.proxy ,null) != null ? [hostname_configuration.value.proxy] : []   
    content{ 
    default_ssl_binding = try(hostname_configuration.value.ssl_binding,null)
    host_name = try(proxy.value.host_name ,null)
    certificate = try(proxy.value.certificate ,null)
    certificate_password = try(proxy.value.certificate_password ,null)
    key_vault_id = try(proxy.value.key_vault_id ,null)
    negotiate_client_certificate = try(proxy.value.negotiate_client_certificate,null)
    ssl_keyvault_identity_client_id = try(proxy.value.ssl_keyvault_identity_client_id,null)
  }  
}
dynamic "scm" {
          for_each = try(hostname_configuration.value.scm ,null) != null ? [hostname_configuration.value.scm] : []   
    content{ 
    host_name = try(scm.value.host_name ,null)
    certificate = try(scm.value.certificate ,null)
    certificate_password = try(scm.value.certificate_password ,null)
    key_vault_id = try(scm.value.key_vault_id ,null)
    negotiate_client_certificate = try(scm.value.negotiate_client_certificate,null)
    ssl_keyvault_identity_client_id = try(scm.value.ssl_keyvault_identity_client_id,null)
  } 
}
  }
  }
  notification_sender_email = try(each.value.notification_sender_email,null)
    dynamic "policy" {
        for_each = try(each.value.policy ,null) != null ? [each.value.proxy] : []  
        content {
          xml_content = try(policy.value.xml_content,null)
          xml_link = try(policy.value.xml_link,null)
        }
    }
#     dynamic "proxy" {
#         for_each = try(each.value.proxy ,null) != null ? [each.value.proxy] : []   
#     content{ 
#     default_ssl_bindings = try(proxy.value.default_ssl_bindings,null)
#     host_name = try(proxy.value.host_name ,null)
#     certificate = try(proxy.value.certificate ,null)
#     certificate_password = try(proxy.value.certificate_password ,null)
#     key_vault_id = try(proxy.value.key_vault_id ,null)
#     negotiate_client_certificate = try(proxy.value.negotiate_client_certificate,null)
#     ssl_keyvault_identity_client_id = try(proxy.value.ssl_keyvault_identity_client_id,null)
#   }    
#   }
  dynamic "protocols" {
        for_each = try(each.value.protocols ,null) != null ? [each.value.protocols] : []   
    content{ 
   enable_http2 = try(protocols.value.enable_http2,null)
  }    
  }
  dynamic "security" {
        for_each = try(each.value.security ,null) != null ? [each.value.security] : []   
    content{ 
   enable_backend_ssl30 = try(security.value.enable_backend_ssl30 ,null)
   enable_backend_tls11 = try(security.value.enable_backend_tls11 ,null)
   enable_frontend_ssl30 = try(security.value.enable_frontend_ssl30 ,null)
   enable_frontend_tls11 = try(security.value.enable_frontend_tls11 ,null)
   enable_frontend_tls10 = try(security.value.enable_frontend_tls10 ,null)
   enable_backend_tls10 = try(security.value.enable_backend_tls10 ,null)
   tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = try(security.value.tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled,null)
   tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = try(security.value.tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled,null)
   tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled = try(security.value.tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled,null)
   tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled = try(security.value.tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled,null)
   tls_rsa_with_aes128_cbc_sha256_ciphers_enabled = try(security.value.tls_rsa_with_aes128_cbc_sha256_ciphers_enabled,null)
   tls_rsa_with_aes128_cbc_sha_ciphers_enabled = try(security.value.tls_rsa_with_aes128_cbc_sha_ciphers_enabled,null)
   tls_rsa_with_aes128_gcm_sha256_ciphers_enabled = try(security.value.tls_rsa_with_aes128_gcm_sha256_ciphers_enabled,null)
   tls_rsa_with_aes256_cbc_sha256_ciphers_enabled =  try(security.value.tls_rsa_with_aes256_cbc_sha256_ciphers_enabled,null)
   tls_rsa_with_aes256_cbc_sha_ciphers_enabled =  try(security.value.tls_rsa_with_aes256_cbc_sha_ciphers_enabled,null)
   tls_rsa_with_aes256_gcm_sha384_ciphers_enabled =try(security.value.tls_rsa_with_aes256_gcm_sha384_ciphers_enabled,null) 
   triple_des_ciphers_enabled = try(security.value.triple_des_ciphers_enabled,null)
  }    
  }
  dynamic "sign_in" {
        for_each = try(each.value.sign_in ,null) != null ? [each.value.sign_in] : []   
    content{ 
  enabled = try(sign_in.value.enabled ,null) 
  }
    
  }
  dynamic "sign_up" {
        for_each = try(each.value.sign_up ,null) != null ? [each.value.sign_up] : []   
    content{ 
  enabled = try(sign_up.value.enabled,null)
    dynamic "terms_of_service"{
    for_each = try(sign_up.value.terms_of_service ,null) != null ? [sign_up.value.terms_of_service] : []   
    content{
  consent_required = try(terms_of_service.value.consent_required,null)
  enabled=try(terms_of_service.value.enabled,null)
  text = try(terms_of_service.value.text,null)
    } 
  }
  }
  }
  dynamic "tenant_access" {
        for_each = try(each.value.tenant_access ,null) != null ? [each.value.tenant_access] : []   
    content{
  enabled = try(tenant_access.value.enabled,null)
  }
  }
  public_ip_address_id = try(each.value.public_ip_address_id,null)
  public_network_access_enabled = try(each.value.public_network_access_enabled,null)
  virtual_network_type = try(each.value.virtual_network_type,null)
  dynamic "virtual_network_configuration" {
            for_each = try(each.value.virtual_network_configuration ,null) != null ? [each.value.virtual_network_configuration] : []   
    content{
        subnet_id = azurerm_subnet.subnet[virtual_network_configuration.value.sub_id].id
    }
  }
  
#   dynamic "terms_of_service"{
#     for_each = try(each.value.terms_of_service ,null) != null ? [each.value.terms_of_service] : []   
#     content{
#   consent_required = try(terms_of_service.value.consent_required,null)
#   enabled=try(terms_of_service.value.enabled,null)
#   text = try(terms_of_service.value.text,null)
#     } 
#   }
  tags = try(each.value.tags,null)
  depends_on =[azurerm_virtual_network.vnet]
}
resource "azurerm_api_management_user" "users" {
  for_each = var.users
  user_id             = try(each.value.user_id,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  api_management_name = azurerm_api_management.apim[each.value.apim_name].name
  first_name          = try(each.value.first_name,null)
  last_name           = try(each.value.last_name ,null)
  email               = try(each.value.email,null)
  state               = try(each.value.state ,null)
  confirmation        = try(each.value.confirmation , null)
  password            = try(each.value.password,null)
  note                = try(each.value.note,null)
}
resource "azurerm_api_management_group" "group" {
  for_each =var.group
  name                = try(each.value.name ,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  api_management_name = azurerm_api_management.apim[each.value.apim_name].name
  display_name        = try(each.value.display_name,null)
  description         = try(each.value.description,null)
  external_id =try(each.value.external_id ,null)
  type =try(each.value.type , null)
}
resource "azurerm_api_management_identity_provider_aad" "identities" {
  for_each =var.identities
  resource_group_name = data.azurerm_resource_group.rgname.name
  api_management_name = azurerm_api_management.apim[each.value.apim_name].name
  client_id           = try(each.value.client_id,null)
  client_secret       = try(each.value.client_secret,null)
  allowed_tenants     = try(each.value.allowed_tenants,null)
  signin_tenant     = try(each.value.signin_tenant,null)
}
resource "azurerm_api_management_product" "products" {
  for_each = var.products
  product_id            = try(each.value.product_id,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  api_management_name = azurerm_api_management.apim[each.value.apim_name].name
  display_name          = try(each.value.display_name,null)
  subscription_required = try(each.value.subscription_required,null)
  approval_required     = try(each.value.approval_required,null)
  published             = try(each.value.published,null)
  subscriptions_limit   = try(each.value.subscriptions_limit,null)
  terms                 = try(each.value.terms,null)
}
resource "azurerm_api_management_named_value" "named_valued" {
  for_each =var.named_valued
  name                = try(each.value.name,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  api_management_name = azurerm_api_management.apim[each.value.apim_name].name
  display_name        = try(each.value.display_name,null)
  value               = try(each.value.value,null)
  secret              = try(each.value.secret,null)
  dynamic "value_from_key_vault"{
        for_each = try(each.value.value_from_key_vault ,null) != null ? [each.value.value_from_key_vault] : []   
    content{
     secret_id = try(value_from_key_vault.value.secret_id,null)
     identity_client_id =try(value_from_key_vault.value.identity_client_id,null)
  
    }
  }
}
resource "azurerm_api_management_api" "apiname" {
  for_each = var.apiname
  name                = try(each.value.name ,null)
  resource_group_name = data.azurerm_resource_group.rgname.name
  api_management_name = azurerm_api_management.apim[each.value.apim_name].name
  revision            = try(each.value.revision ,null)
}

resource "azurerm_api_management_tag" "tags" {
  for_each = var.tags
  api_management_id = azurerm_api_management.apim[each.value.apim_id].id
  name              = try(each.value.name ,null)
}

resource "azurerm_api_management_api_tag" "apitags" {
  for_each = var.apitags
  api_id = azurerm_api_management_api.apiname[each.value.appid].id
  name   = try(each.value.name ,null)
}
# resource "azurerm_api_management_certificate" "certificate" {
  # for_each= var.certificate
#   name                = try(each.value.name,null)
  # resource_group_name = data.azurerm_resource_group.rgname.name
  # api_management_name = azurerm_api_management.apim[each.value.apim_name].name

#   key_vault_secret_id = 
# }
# resource "azurerm_api_management_developer_portal" "developer_portal" {
#   for_each =var.developer_portal
# api_management_name =azurerm_api_management.apim[each.value.apim_name].name
# resource_group_name =data.azurerm_resource_group.rgname.name
# dynamic "content" {
# for_each = try(each.value.content ,null) != null ? [each.value.contents] : []  
#     content{
# home-page = try(content.value.home_page ,null)

# }
# }
# }