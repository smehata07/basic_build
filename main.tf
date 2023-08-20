terraform {
  required_providers{
  google = {
    
    source  = "hashicorp/google"
    version = " ~> 4.60.0"
  }  
  } 
}

provider "google" {
  project = "vm-deployment-apac"
  region  = "asia-east1"
}
module "vpc" {
source = "github.com/smehata07/modules/tree/main/VPC"
for_each = var.vpc
vpc_name = each.value.vpc_name
subnet_name = each.value.subnet_name
ip_range = each.value.ip_range

}
module "VM1" {
source       = "github.com/smehata07/modules/tree/main/Virtual%20Machine"
for_each     = var.virtual_machines
server_name  = each.value.server_name
machine_type = each.value.machine_type
zone         = each.value.server_zone
network_name = google_compute_network.vpc-apac-01.name
static_ip    = each.value.statics_ip
subnet_name  = google_compute_subnetwork.subnet-apac-01.name
}
