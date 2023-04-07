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

resource "google_compute_network" "vpc-cloud-build" {
  name                    = "vpc-through-cloud-build"
}
