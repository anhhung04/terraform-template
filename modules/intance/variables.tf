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
