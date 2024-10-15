# Outputs

output "vm_ids" {
  description = "The IDs of the created VMs"
  value       = module.vm[*].vm_id
}

output "vm_names" {
  description = "The names of the created VMs"
  value       = module.vm[*].vm_name
}
