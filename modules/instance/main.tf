resource "vultr_instance" "main" {
  count             = var.instance_count
  region            = var.region
  plan              = var.plan
  os_id             = var.os_id
  label             = "${var.instance_label}-${count.index + 1}"
  vpc_ids           = [var.vpc_id]
  firewall_group_id = var.firewall_group_id
  backups = var.backups
  hostname = "${var.instance_label}-${count.index + 1}"
  tags = var.tags
  ssh_key_ids = var.ssh_key_ids
}
