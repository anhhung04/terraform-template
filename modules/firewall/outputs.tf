output "firewall_group_id" {
  description = "The ID of the created firewall group"
  value       = vultr_firewall_group.main.id
}
