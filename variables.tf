variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  sensitive   = true
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
}


variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_user" {
  description = "Proxmox User"
  type        = string
}

variable "pm_password" {
  description = "Proxmox Password"
  type        = string
  sensitive   = true
}

variable "github_usernames" {
  description = "List of GitHub usernames to fetch SSH keys for"
  type        = list(string)
  default     = []
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}