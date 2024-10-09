terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.12.0"
    }
  }

  required_version = ">= 1.0.0"
}
