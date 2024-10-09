variable "firewall_group_description" {
  description = "Description for the firewall group"
  type        = string
}

variable "inbound_rules" {
  description = "List of inbound firewall rules"
  type = list(object({
    protocol    = string
    port_range  = string
    subnet      = string
    subnet_size = number
    notes       = string
  }))
  default = []
}

variable "outbound_rules" {
  description = "List of outbound firewall rules"
  type = list(object({
    protocol    = string
    port_range  = string
    subnet      = string
    subnet_size = number
    notes       = string
  }))
  default = []
}
