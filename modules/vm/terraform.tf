terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}