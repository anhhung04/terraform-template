output "vm_id" {
  description = "The ID of the VM"
  value       = proxmox_vm_qemu.vm.id
}

output "vm_name" {
  description = "The name of the VM"
  value       = proxmox_vm_qemu.vm.name
}

output "vm_ip" {
  description = "The IP address of the VM"
  value       = proxmox_vm_qemu.vm.default_ipv4_address
}

output "vm_password" {
  description = "The generated password for the VM"
  value       = random_password.vm_password.result
  sensitive   = true
}
