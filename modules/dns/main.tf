data "vultr_dns_domain" "domain" {
  domain = var.domain_name
}

resource "vultr_dns_record" "a_record" {
  count  = length(var.a_records)
  domain = data.vultr_dns_domain.domain.id
  name   = var.a_records[count.index].name
  type   = "A"
  data   = var.a_records[count.index].ip
  ttl    = var.ttl
}

resource "vultr_dns_record" "cname_record" {
  count  = length(var.cname_records)
  domain = data.vultr_dns_domain.domain.id
  name   = var.cname_records[count.index].name
  type   = "CNAME"
  data   = var.cname_records[count.index].value
  ttl    = var.ttl
}
