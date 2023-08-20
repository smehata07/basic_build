variable "vpc" {
  type = map(object({
    vpc_name    = string
    subnet_name = string
    ip_range    = string
  }))
    default = {
    "vpc1" = {
    vpc_name    = "sonu-vpc-1-object"
    subnet_name = "sonu-subne-1-object"
    ip_range    = "10.0.0.0/24"
}}
}

variable "virtual_machines" {
  type = map(object({
    server_name  = string
    machine_type = string
    server_zone  = string
    vpc_name     = string
    static_ip    = string
    subnet_name  = string
  }))
default = {

  "vm1" = {
    server_name  = "sonu-vm-1-object"
    machine_type = "e2-micro"
    server_zone  = "asia-east1-b"
    vpc_name     = "sonu-vpc-1-object"
    static_ip    = "10.0.0.1"
    subnet_name  = "sonu-subnet-1-object"
}
}


}

