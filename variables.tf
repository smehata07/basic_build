variable "vpc" {
  type = map(object)

  default = {
    "vpc1" = {
      vpc_name    = "sonu_vpc_1_object"
      subnet_name = "sonu_subnet_1_object"
      ip_range    = "10.0.0.0/24"
    }
  }
}

variable "virtual_machines" {
  type = map(object)

  default = {
    "vm1" = {
      server_name = "sonu_vm_1_object"
      machine_type = "e2-micro"
      server_zone = "asia-east1-b"
      vpc_name = "sonu_vpc_1_object"
      static_ip = "10.0.0.1"
      subnet_name = "sonu_subnet_1_object"
    }
  }
}


