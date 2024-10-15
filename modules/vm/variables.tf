variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_description" {
  description = "Description of the VM"
  type        = string
  default     = "Terraform managed VM"
}

variable "pve_node" {
  description = "Name of the Proxmox node"
  type        = string
}

variable "template" {
  description = "Name of the template to clone"
  type        = string
}

variable "tags" {
  description = "List of tags to apply to the VM"
  type        = list(string)
  default     = []
}

variable "pool" {
  description = "Resource pool for the VM"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Amount of memory in MB"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Size of the disk"
  type        = string
  default     = "4G"
}

variable "iso_storage_pool" {
  description = "Storage pool for the ISO"
  type        = string
}

variable "network_bridge" {
  description = "Network bridge to use"
  type        = string
  default     = "vmbr0"
}

variable "ssh_keys" {
  description = "List of SSH public keys"
  type        = list(string)
}

variable "run_provisioner" {
  description = "Whether to run the provisioner"
  type        = bool
  default     = false
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
  default     = ""
}

variable "provisioner_commands" {
  description = "List of commands to run in the provisioner"
  type        = list(string)
  default     = ["ip a"]
}
