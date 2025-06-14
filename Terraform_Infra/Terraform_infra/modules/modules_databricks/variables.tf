variable "databricks" {
  type        = map(object({
    name = string
    location = string
    sku    = string
    public_network_access_enabled = bool
    # network_security_group_rules_required =bool
    customer_managed_key_enabled = bool
    infrastructure_encryption_enabled = bool
    public_ip_name = string
    nat_gateway_name = string
    no_public_ip = bool
    tags =map(string)
  }))
}
variable "managed_resource_group_name" {
  type = string
}