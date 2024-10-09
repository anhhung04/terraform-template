resource "vultr_instance" "main" {
  count       = var.instance_count
  region      = var.region
  plan        = var.plan
  os_id       = var.os_id
  label       = "${var.instance_label}-${count.index + 1}"
  vpc_ids     = [var.vpc_id]
  enable_ipv6 = true
}
