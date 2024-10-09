module "network" {
  source = "../../modules/network"

  region = var.region
  vpc_name = "prod-vpc"
  vpc_cidr = "10.1.0.0/16"
}

module "instance" {
  source = "../../modules/instance"

  region = var.region
  instance_count = 4
  instance_label = "prod-instance"
  plan = "vc2-2c-4gb"
  os_id = "387"  # Ubuntu 20.04 x64
  vpc_id = module.network.vpc_id
}

module "dns" {
  source = "../../modules/dns"

  domain_name = var.domain_name
  a_records = [
    {
      name = "www"
      ip   = module.ec2.instance_ips[0]
    },
    {
      name = "api"
      ip   = module.ec2.instance_ips[1]
    }
  ]
  cname_records = [
    {
      name  = "app"
      value = "www.${var.domain_name}."
    }
  ]
}
