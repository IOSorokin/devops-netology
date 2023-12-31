variable "vm_db_vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_db_platform" {
  type = string 
  default = "standard-v1"
  description = "yandex_compute_instance platform var.platfrom"
}

variable "vm_db_name" {
  type = string  
  default = "netology-develop-platform-db"
  description = "yandex_compute_instance platform var.name"
}

variable "vm_db_username" {
  type = string
  default = "ubuntu"
  description = "virtual machine user"
  
}
