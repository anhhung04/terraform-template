variable "region" {
  description = "The Vultr region to deploy to"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "instance_label" {
  description = "Label for the instances"
  type        = string
}

variable "plan" {
  description = "The Vultr plan to use for the instances"
  type        = string
}

variable "os_id" {
  description = "The OS ID to use for the instances"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to deploy the instances in"
  type        = string
}

variable "firewall_group_id" {
  description = "The ID of the firewall group to associate with the instances"
  type        = string
}

variable "backups" {
  description = "Whether to enable backups for the instances"
  type        = string
  default     = "disabled"
}

variable "tags" {
  description = "Tags to apply to the instances"
  type        = list(string)
  default     = []
}

variable "ssh_key_ids" {
  description = "SSH key IDs to associate with the instances"
  type        = list(string)
  default     = []
}