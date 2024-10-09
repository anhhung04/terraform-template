output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.network.vpc_id
}

output "instance_ids" {
  description = "IDs of the created instances"
  value       = module.instance.instance_ids
}

output "instance_ips" {
  description = "Public IPs of the created instances"
  value       = module.instance.instance_ips
}

output "domain_id" {
  description = "The ID of the created domain"
  value       = module.dns.domain_id
}

output "a_record_ids" {
  description = "The IDs of the created A records"
  value       = module.dns.a_record_ids
}

output "cname_record_ids" {
  description = "The IDs of the created CNAME records"
  value       = module.dns.cname_record_ids
}
