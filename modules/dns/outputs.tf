output "domain_id" {
  description = "The ID of the created domain"
  value       = vultr_dns_domain.domain.id
}

output "a_record_ids" {
  description = "The IDs of the created A records"
  value       = vultr_dns_record.a_record[*].id
}

output "cname_record_ids" {
  description = "The IDs of the created CNAME records"
  value       = vultr_dns_record.cname_record[*].id
}
