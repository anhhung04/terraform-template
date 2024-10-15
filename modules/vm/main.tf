resource "random_password" "vm_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  desc        = var.vm_description
  target_node = var.pve_node
  pool        = var.pool
  cores       = var.cores
  sockets     = var.sockets
  memory      = var.memory

  clone = var.template

  clone_wait = 60
  
  agent       = 1

  tags = join(",", concat(["terraform"], var.tags))

  scsihw = "virtio-scsi-pci"
  ci_wait = true

  disks {
    scsi {
      scsi0 {
        cdrom {
          iso = proxmox_cloud_init_disk.ci.id
        }
      }
      scsi1 {
        disk {
          size    = var.disk_size
          storage = var.iso_storage_pool
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = var.network_bridge
  }

  os_type = "cloud-init"

  ipconfig0 = "ip=dhcp"
}

resource "proxmox_cloud_init_disk" "ci" {
  name     = var.vm_name
  pve_node = var.pve_node
  storage  = var.iso_storage_pool

  user_data = templatefile("${path.module}/cloud-init/user-data.yml", {
    hostname  = var.vm_name
    password  = random_password.vm_password.result
    ssh_keys  = var.ssh_keys
  })

  network_config = templatefile("${path.module}/cloud-init/network-config.yml", {})
}
