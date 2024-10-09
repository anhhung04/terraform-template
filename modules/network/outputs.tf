output "vpc_id" {
  description = "ID of the created VPC"
  value       = vultr_vpc.main.id
}
