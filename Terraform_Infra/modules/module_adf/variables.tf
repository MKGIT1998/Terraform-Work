variable "adf" {
  type = map(object({
    name     = string
    location = string
    public_network_enabled = bool
  }))
}
