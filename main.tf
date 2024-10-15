module "proxmox_vm" {
  source = "./modules/vm"

  vm_name          = "my-terraform-vm"
  pve_node         = "proxmox1-xx"
  pool             = "pool0"
  cores            = 1
  memory           = 1024
  disk_size        = "20G"
  iso_storage_pool = "local-lvm"
  network_bridge   = "vmbr0"
  ssh_keys         = [
    for resp in data.http.github_keys : resp.body
  ]

  template = "ci-ubuntu-20.04-cloudimg"
}

output "vm_ip" {
  value = module.proxmox_vm.vm_ip
}

output "vm_id" {
  value = module.proxmox_vm.vm_id
}
