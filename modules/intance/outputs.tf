output "instance_ids" {
  description = "IDs of the created instances"
  value       = vultr_instance.main[*].id
}

output "instance_ips" {
  description = "Public IPs of the created instances"
  value       = vultr_instance.main[*].main_ip
}
