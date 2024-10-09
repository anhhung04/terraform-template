variable "domain_name" {
  description = "The domain name to manage"
  type        = string
}

variable "a_records" {
  description = "List of A records to create"
  type = list(object({
    name = string
    ip   = string
  }))
  default = []
}

variable "cname_records" {
  description = "List of CNAME records to create"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "ttl" {
  description = "TTL for DNS records"
  type        = number
  default     = 3600
}
