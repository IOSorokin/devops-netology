output "vm_external_nat_ip_address" {
 value = yandex_compute_instance.netology-develop-platform-db.network_interface[0].nat_ip_address
description = "vm_db external ip"
}

output "vm_web_external_nat_ip_address" {
 value = yandex_compute_instance.netology-develop-platform-web.network_interface[0].nat_ip_address
description = "vm_web external ip"
}