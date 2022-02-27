variable "vpc_name" {
    type = "string"
    default = "dev"
    description = "this vpc name"
  
}

variable "cidr_number" {
    type = "number"
    default = "10.1.0.0/16"
}

variable "regionName" {}

variable "pubsubnet" {
    type = list 
    default = []
  
}
