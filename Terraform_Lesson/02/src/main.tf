resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
data "yandex_compute_image" "ubuntu-2004-lts" {
  family = var.family
}
resource "yandex_compute_instance" "netology-develop-platform-web" {
   name        = local.name_local_vm_web
#  name        = var.vm_web_name
  platform_id = var.vm_web_platform
resources {
    cores         = var.vms_resources_web.cores
    memory        = var.vms_resources_web.memory
    core_fraction = var.vms_resources_web.core_fraction
  }
#  resources {
#    cores         = 2
#   memory         = 1
#    core_fraction = 5
#  }  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vm_username}:${var.vms_ssh_root_key}"
  }
}

resource "yandex_compute_instance" "netology-develop-platform-db" {
   name        = local.name_local_vm_db
#  name        = var.vm_db_name
  platform_id = var.vm_db_platform

resources {
  cores = var.vms_resources_db.cores
  memory = var.vms_resources_db.memory
  core_fraction = var.vms_resources_db.core_fraction
}
# resources {
#   cores         = 2
#   memory        = 2
#   core_fraction = 20
# }  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vm_username}:${var.vms_ssh_root_key}"
  }
}