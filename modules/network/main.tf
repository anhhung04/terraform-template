locals {
  vpc_cidr = var.vpc_cidr
  vpc_cidr_split = split("/", var.vpc_cidr)
  vpc_subnet = local.vpc_cidr_split[0]
  vpc_subnet_mask = local.vpc_cidr_split[1]
}

resource "vultr_vpc" "main" {
  region     = var.region
  description = var.vpc_name
  v4_subnet   = local.vpc_subnet
  v4_subnet_mask = local.vpc_subnet_mask
}
