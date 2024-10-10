module "network" {
  source = "../../modules/network"

  region = var.region
  vpc_name = "prod-vpc"
  vpc_cidr = "10.1.0.0/16"
}

module "instance" {
  source = "../../modules/instance"

  region            = var.region
  instance_count    = 2
  instance_label    = "${var.environment}-instance"
  plan              = "vc2-1c-1gb"
  os_id             = "387"  # Ubuntu 20.04 x64
  vpc_id            = module.network.vpc_id
  firewall_group_id = module.firewall.firewall_group_id
}

resource "local_file" "inventory" {
  content = <<-EOF
[machine]
%{ for instance_ip in module.instance.instance_ips ~}
${instance_ip}
%{ endfor ~}
EOF

  filename = "${path.module}/../../ansible/inventory.cfg"
}

module "dns" {
  source = "../../modules/dns"

  domain_name = var.domain_name
  a_records = [
    {
      name = "app"
      ip   = module.instance.instance_ips[0]
    },
    {
      name = "api"
      ip   = module.instance.instance_ips[1]
    }
  ]
  cname_records = []
}

module "firewall" {
  source = "../../modules/firewall"

  firewall_group_description = "${var.environment} firewall group"
  inbound_rules = [
    {
      protocol    = "tcp"
      port_range  = "22"
      subnet      = "0.0.0.0"
      subnet_size = 0
      notes       = "Allow SSH from anywhere"
    },
    {
      protocol    = "tcp"
      port_range  = "80"
      subnet      = "0.0.0.0"
      subnet_size = 0
      notes       = "Allow HTTP from anywhere"
    },
    {
      protocol    = "tcp"
      port_range  = "443"
      subnet      = "0.0.0.0"
      subnet_size = 0
      notes       = "Allow HTTPS from anywhere"
    }
  ]
  outbound_rules = [
    {
      protocol    = "tcp"
      port_range  = "1-65535"
      subnet      = "0.0.0.0"
      subnet_size = 0
      notes       = "Allow all outbound TCP traffic"
    },
    {
      protocol    = "udp"
      port_range  = "1-65535"
      subnet      = "0.0.0.0"
      subnet_size = 0
      notes       = "Allow all outbound UDP traffic"
    }
  ]
}
