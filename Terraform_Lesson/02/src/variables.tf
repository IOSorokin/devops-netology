###cloud vars

variable "token" {
  type = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_platform" {
  type = string 
  default = "standard-v1"
  description = "yandex_compute_instance platform var.platfrom"
}

variable "vm_web_name" {
  type = string  
  default = "netology-develop-platform-web"
  description = "yandex_compute_instance platform var.name"
}

variable "family" {
  type = string
  default = "ubuntu-2004-lts"  
  description = "VM Family"
}

variable "vm_username" {
  type = string
  default = "ubuntu"
  description = "virtual machine user"
}

variable "vms_resources_db" {
  description = "resources for VM db"
  type = map
  default = {
     cores         = 2
     memory        = 2
     core_fraction = 20
  }
}

variable "vms_resources_web" {
  description = "resources for VM web"
  type = map
  default = {
     cores         = 2
     memory        = 1
     core_fraction = 5
  }
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHq5Ml8nzQRncDIfG8LVBfl8F7RafMOzNWFC9aqh+L8n root@dev"
  description = "ssh-keygen -t ed25519"
}
