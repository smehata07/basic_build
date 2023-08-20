terraform {
  required_providers {
    google = {

      source  = "hashicorp/google"
      version = " ~> 4.60.0"
    }
  }
}

provider "google" {
  project     = "vm-deployment-apac"
  region      = "asia-east1"
}

module "vpc" {
  source      = "github.com/smehata07/modules.git//VPC"
  for_each    = var.vpc
  vpc_name    = each.value.vpc_name
  subnet_name = each.value.subnet_name
  ip_range    = each.value.ip_range
}

module "VM1" {
  source       = "github.com/smehata07/modules.git//Virtual Machine"
  for_each     = var.virtual_machines
  server_name  = each.value.server_name
  machine_type = each.value.machine_type
  zone         = each.value.server_zone
  network_name = each.value.vpc_name
  static_ip    = each.value.static_ip
  subnet_name  = each.value.subnet_name

  depends_on = [module.vpc]
}
