# Ubuntu Server
# ---

# Variable Definitions
variable "proxmox_api_url" {
  type    = string
  default = env("PM_API_URL")
}

variable "proxmox_user" {
  type    = string
  default = env("PM_USER")
}

variable "proxmox_password" {
  type      = string
  default   = env("PM_PASS")
  sensitive = true
}

variable "storage_pool" {
  type    = string
  default = "local-lvm"
}

source "proxmox-iso" "base" {

  # Proxmox Connection Settings
  proxmox_url = "${var.proxmox_api_url}"
  username    = "${var.proxmox_user}"
  password   = "${var.proxmox_password}"
  # (Optional) Skip TLS Verification
  insecure_skip_tls_verify = true

  # VM General Settings
  node                 = "machine3"
  vm_name              = "ubuntu2204-template"
  template_description = "Ubuntu 22.04 Image"
  # pool                 = ""

  # VM OS Settings
  # (Option 1) Local ISO File
  # iso_file = "local:iso/ubuntu-22.04.1-live-server-amd64.iso"
  # - or -
  # (Option 2) Download ISO
  iso_url          = "https://old-releases.ubuntu.com/releases/22.04/ubuntu-22.04.1-live-server-amd64.iso"
  iso_checksum     = "10f19c5b2b8d6db711582e0e27f5116296c34fe4b313ba45f9b201a5007056cb"
  iso_storage_pool = "local"
  unmount_iso      = true
  os               = "l26"

  # VM System Settings
  qemu_agent = true

  # VM Hard Disk Settings
  scsi_controller = "virtio-scsi-pci"

  disks {
    disk_size    = "20G"
    storage_pool = var.storage_pool
    type         = "virtio"
  }

  # VM CPU Settings
  cores   = 1
  sockets = 2

  # VM Memory Settings
  memory = 4096

  # VM Network Settings
  network_adapters {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = "false"
  }

  # VM Cloud-Init Settings
  cloud_init              = true
  cloud_init_storage_pool = var.storage_pool

  # PACKER Boot Commands 
  boot_command = [
    "<esc><wait>",
    "e<wait>",
    "<down><down><down><end>",
    "<bs><bs><bs><bs><wait>",
    "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
    "<f10><wait>"
  ]
  boot      = "c"
  boot_wait = "5s"

  # PACKER Autoinstall Settings
  http_directory = "data"
  # (Optional) Bind IP Address and Port
  // http_bind_address = "0.0.0.0"
  http_port_min = 3000
  http_port_max = 3000

  ssh_username = "ubuntu"

  # (Option 1) Add your Password here
  ssh_password = "password"
  # - or -
  # (Option 2) Add your Private SSH KEY file here
  # ssh_private_key_file = "~/.ssh/id_rsa"

  # Raise the timeout, when installation takes longer
  ssh_timeout = "60m"
}

# Build Definition to create the VM Template
build {

  name    = "ubuntu2204-template"
  sources = ["source.proxmox-iso.base"]

  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt upgrade -y",
      "sudo apt install -y curl vim git ca-certificates",
    ]
  }

  provisioner "shell" {
    inline = [
      "for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done",
      "curl -fsSL https://get.docker.com | sh",
      "sudo usermod -aG docker ubuntu",
    ]
  }

  provisioner "shell" {
  inline = [
    "sudo apt autoremove -y",
    "sudo apt clean",
    "sudo rm -rf /var/lib/apt/lists/*",
    "sudo truncate -s 0 /var/log/*log"
  ]
}

}
