variable "adf" {
  type        = map(object({
    name = string
    location = string
    public_network_enabled = bool
    identity_ids           = list(string)
    # customer_managed_key_id = string
    # customer_managed_value_id = string
    type           = string
    tags =map(string)
  }))
}
variable "user_assigned_identity_name" {
  type        = map(object({
    name = string
    location = string
  }))
}

