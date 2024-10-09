# Vultr Infrastructure as Code with Terraform

This repository contains Terraform configurations for managing infrastructure on Vultr. It uses a modular approach to define network and compute resources, with separate environments for development and production.

## Repository Structure

```
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── terraform.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── prod
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── terraform.tf
│       ├── terraform.tfvars
│       └── variables.tf
└── modules
   ├── instance
   │   ├── main.tf
   │   ├── outputs.tf
   │   ├── variables.tf
   │   └── versions.tf
   ├── network
   │   ├── main.tf
   │   ├── outputs.tf
   │   ├── variables.tf
   │   └── versions.tf
   ├── dns
   │   ├── main.tf
   │   ├── outputs.tf
   │   ├── variables.tf
   │   └── versions.tf
   └── firewall
       ├── main.tf
       ├── outputs.tf
       ├── variables.tf
       └── versions.tf
```

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) (version 1.9.7 or later)
2. A Vultr account and API key

## Configuration

1. Navigate to the environment you want to deploy (dev or prod) in the `environments` directory.
2. Edit the `terraform.tfvars` file to set your Vultr API key and desired region:

```hcl
region = "ewr"  # Change this to your preferred region
vultr_api_key = "your-api-key-here"
```

3. In the same `terraform.tfvars` file, set your domain name:

```hcl
domain_name = "yourdomain.com"
```

4. In the same `terraform.tfvars` file, set your environment:

```hcl
environment = "dev"  # or "prod" for production
```

**Note:** Keep your API key secret and never commit it to version control.

## Usage

To deploy the infrastructure:

1. Navigate to the environment directory you want to deploy:

   ```
   cd environments/dev  # or environments/prod
   ```

2. Initialize Terraform:

   ```
   terraform init
   ```

3. Review the planned changes:

   ```
   terraform plan
   ```

4. Apply the changes:

   ```
   terraform apply
   ```

5. When prompted, type `yes` to confirm the changes.

To destroy the infrastructure:

```
terraform destroy
```

## Modules

### Network Module

This module creates a VPC in the specified region.

### Instance Module

This module creates Vultr instances within the specified VPC.

### DNS Module

This module manages DNS records for a specified domain. It can create:

- The domain itself in Vultr's DNS management
- A records
- CNAME records

### Firewall Module

This module creates a firewall group and associated rules to control inbound and outbound traffic for your Vultr instances.

## Environments

### Development (dev)

- Creates a VPC with CIDR block 10.0.0.0/16
- Deploys 2 small instances (vc2-1c-1gb)

### Production (prod)

- Creates a VPC with CIDR block 10.1.0.0/16
- Deploys 4 medium instances (vc2-2c-4gb)

## Customization

To modify the infrastructure:

1. Edit the `main.tf` file in the respective environment directory.
2. Adjust variables in `variables.tf` and `terraform.tfvars` as needed.
3. Modify or extend the modules in the `modules` directory to add or change resources.

## Security Notes

- Always use separate API keys for different environments.
- Consider using Terraform workspaces or separate state files for each environment.
- Implement proper access controls and security groups in your Vultr setup.
