resource "vultr_vpc" "main" {
  region     = var.region
  description = var.vpc_name
  v4_subnet   = var.vpc_cidr
}
