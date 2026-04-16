# --- MULTI-CLOUD PROVIDER CONFIGURATION ---

terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 1. PRIVATE CLOUD: OpenStack (MicroStack)
provider "openstack" {
  auth_url    = "https://10.20.20.1:5000/v3"
  insecure    = true
  user_name   = "admin"
  tenant_name = "admin"
  password    = "StoU08R2Fgf9T86t7IWSeRyKBTUUR2Nt" # Your Day 3 password
  domain_id   = "default"
  region      = "microstack"
}

# 2. PUBLIC CLOUD SIMULATION: AWS (LocalStack)
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  s3_use_path_style           = true  # Force path-style (localhost:4566/bucket)
  # Points Terraform to your LocalStack container instead of the real AWS
  endpoints {
    s3 = "http://localhost:4566"
  }
}

# --- MULTI-CLOUD RESOURCES ---

# Resource A: The VM on your Private Cloud
resource "openstack_compute_instance_v2" "private_vm" {
  name        = "openstack-vm-day4"
  image_name  = "cirros"
  flavor_name = "m1.tiny"
  network {
    name = "hybrid-net"
  }
}

# Resource B: The Storage Bucket on your Simulated Public Cloud
resource "aws_s3_bucket" "public_storage" {
  bucket = "intern-multicloud-demo"
}
