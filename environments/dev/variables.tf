variable "region" {
  description = "The Vultr region to deploy to"
  type        = string
}

variable "vultr_api_key" {
  description = "Vultr API Key"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "The domain name to manage"
  type        = string
}

variable "environment" {
  description = "The environment (dev or prod)"
  type        = string
}
