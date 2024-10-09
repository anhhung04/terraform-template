resource "vultr_firewall_group" "main" {
  description = var.firewall_group_description
}

resource "vultr_firewall_rule" "inbound" {
  for_each = { for rule in var.inbound_rules : "${rule.port_range}${rule.protocol}" => rule }

  firewall_group_id = vultr_firewall_group.main.id
  protocol          = each.value.protocol
  ip_type           = "v4"
  subnet            = each.value.subnet
  subnet_size       = each.value.subnet_size
  port              = each.value.port_range
  notes             = each.value.notes
}

resource "vultr_firewall_rule" "outbound" {
  for_each = { for rule in var.outbound_rules : "${rule.port_range}${rule.protocol}" => rule }

  firewall_group_id = vultr_firewall_group.main.id
  protocol          = each.value.protocol
  ip_type           = "v4"
  subnet            = each.value.subnet
  subnet_size       = each.value.subnet_size
  port              = each.value.port_range
  notes             = each.value.notes
}
