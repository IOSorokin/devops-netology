# Задание 1

В качестве ответа всегда полностью прикладывайте ваш terraform-код в git. Убедитесь что ваша версия Terraform =1.5.Х (версия 1.6.Х может вызывать проблемы с Яндекс провайдером)

root@dev:/home/isadm/DZ02# terraform -v
Terraform v1.5.7
on linux_amd64


1.    Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
	 Рассмотрел файл в файле указаны переменные и названия для создания виртуальной машины в яндекс облаке 

2.  Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные: идентификаторы облака, токен доступа. Благодаря .gitignore этот файл не попадёт в публичный репозиторий.
    Переименовал файл в файле добавил необходимые параметры которые получил через команду 
	* yc config list
	token: y0_AgAAAAA6B84_AATuwQAAAADzVHO07trw1FuYR3qClb2QXRHMf намеренно изменил
	cloud-id: b1g4ddikk6b9vpaieqqn
	folder-id: b1gtu3j8kgn0eg8c84kv
	compute-default-zone: ru-central1-a
	
4. 	Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную vms_ssh_public_root_key. 
	Сгенерировал ssh ключ командой ssh-keygen -t ed25519, добавил ключ в variables.tf 
	
	###ssh vars

  variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIjBYWWoAmRUpxnAqtiWonksShaIjKyCMBHpLRr+Hjwx root@dev"
  description = "ssh-keygen -t ed25519"
}
	

5. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

			КОД успешно инициализировался, намеренно допущены ошибки в файле 
providers.tf. Изменил версию terraform на установленную у меня. Так же переменные были объявлены без ковычек, ошибка синтаксиса. 

 required_version = ">= 1.5.7"
}
provider "yandex" {
  token     = "var.token"
  cloud_id  = "var.cloud_id"
  folder_id = "var.folder_id"
  zone      = "var.default_zone"
}

Инициализация после устранения ошибок успешна:

	root@dev:/home/isadm/DZ02/src# terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of yandex-cloud/yandex...
- Installing yandex-cloud/yandex v0.104.0...
- Installed yandex-cloud/yandex v0.104.0 (unauthenticated)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Incomplete lock file information for providers
│ 
│ Due to your customized provider installation methods, Terraform was forced to calculate lock file checksums locally for the following providers:
│   - yandex-cloud/yandex
│ 
│ The current .terraform.lock.hcl file only includes checksums for linux_amd64, so Terraform running on another platform will fail to install these providers.
│ 
│ To calculate additional checksums for another platform, run:
│   terraform providers lock -platform=linux_amd64
│ (where linux_amd64 is the platform to generate)
╵

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.


Применяю конфиг terraform 

```
root@dev:/home/isadm/DZ02/src# terraform apply
data.yandex_compute_image.ubuntu-2004-lts: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enp6sebti6rp9uno9hfj]
data.yandex_compute_image.ubuntu-2004-lts: Read complete after 0s [id=fd85an6q1o26nf37i2nl]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bt5cfbo2vko3kra3ij]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.platform will be created
  + resource "yandex_compute_instance" "platform" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "ssh-keys"           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIjBYWWoAmRUpxnAqtiWonksShaIjKyCMBHpLRr+Hjwx root@dev"
        }
      + name                      = "netology-develop-platform-web"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd85an6q1o26nf37i2nl"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = "e9bt5cfbo2vko3kra3ij"
        }

      + resources {
          + core_fraction = 5
          + cores         = 2
          + memory        = 1
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.platform: Creating...
yandex_compute_instance.platform: Still creating... [10s elapsed]
yandex_compute_instance.platform: Still creating... [20s elapsed]
yandex_compute_instance.platform: Still creating... [30s elapsed]
yandex_compute_instance.platform: Still creating... [40s elapsed]
yandex_compute_instance.platform: Creation complete after 44s [id=fhm4ic6v7pujnuvakv6h]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```

root@dev:/home/isadm/DZ02/src# curl ifconfig.me
62.217.190.223root@dev:/home/isadm/DZ02/src# 


## Подключитесь к консоли ВМ через ssh и выполните команду  curl ifconfig.me. 
Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address". 
Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: eval $(ssh-agent) && ssh-add 
Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;

```

root@dev:/home/isadm/DZ02/src# ssh -i /root/.ssh/id_ed25519 ubuntu@84.201.135.44
Enter passphrase for key '/root/.ssh/id_ed25519': 
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Fri Dec 22 13:46:43 2023 from 62.217.190.223
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@fhm3ib2jj6jnm6f9da8j:~$ curl ifconfig.me
84.201.135.44ubuntu@fhm3ib2jj6jnm6f9da8j:~$ 
```
![изображение](https://github.com/IOSorokin/devops-netology/assets/148979909/11eda4af-bb0d-426f-9874-83cc8bc85a5f)



## 7. Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.

Параметр preemptible = true (Прерываемые ВМ) Это машины которые могут быть остановлены в любой момент, а именно:
		1. Если с момента старта машины прошло 24 часа
		2. Если вознкла нехватка ресурсов
Прерываемые ВМ полезны тем что они как правило дешевле, и в случаях если ресурсы ограничены. 
core_fraction=5 могут пригодится для ограничения производительности если это необходимо, соответственно экономятся важные ресурсы облака. (Зачем использовать машину на 100% если в этом нет необходимости в некоторых случаях).

Фото личного кабинета с созданной виртуальной машиной

# Задание 2

1. Изучите файлы проекта.
2.  Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
    Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
3.   Проверьте terraform plan. Изменений быть не должно.

Ответ: После замены всех хардкорных значений терраформ план не изменился об этом говорит вывод команды:

```
root@dev:/home/isadm/DZ02/src# terraform plan
data.yandex_compute_image.ubuntu-2004-lts: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enp4fv8u4lidiea4agg8]
data.yandex_compute_image.ubuntu-2004-lts: Read complete after 0s [id=fd8k54g2t50mekbk1ie1]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bviqiicobfho2lslb6]
yandex_compute_instance.platform: Refreshing state... [id=fhmn9g6bo19u2olko0pd]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
root@dev:/home/isadm/DZ02/src# 
```

# Задание 3
## 1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
	Переменные перенесены
 
![изображение](https://github.com/IOSorokin/devops-netology/assets/148979909/1a67f612-96e4-4d37-a34a-84a8dffcc5dd)


## 2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf').
	Скопировал блок и поправил переменные

![изображение](https://github.com/IOSorokin/devops-netology/assets/148979909/be063e81-25f7-41bf-9071-2a545ff70288)

## 3. Примените изменения.

	После применения 

```
root@dev:/home/isadm/DZ02/src# terraform plan
data.yandex_compute_image.ubuntu-2004-lts: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enp4fv8u4lidiea4agg8]
data.yandex_compute_image.ubuntu-2004-lts: Read complete after 0s [id=fd8k54g2t50mekbk1ie1]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bviqiicobfho2lslb6]
yandex_compute_instance.platform: Refreshing state... [id=fhmn9g6bo19u2olko0pd]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.netology-develop-platform-db will be created
  + resource "yandex_compute_instance" "netology-develop-platform-db" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "ssh-keys"           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHq5Ml8nzQRncDIfG8LVBfl8F7RafMOzNWFC9aqh+L8n root@dev"
        }
      + name                      = "netology-develop-platform-web"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8k54g2t50mekbk1ie1"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = "e9bviqiicobfho2lslb6"
        }

      + resources {
          + core_fraction = 20
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
root@dev:/home/isadm/DZ02/src#
```
	Скрин кабинета Яндекс
 ![изображение](https://github.com/IOSorokin/devops-netology/assets/148979909/d450da34-86c0-49f7-af2e-31576cf4eef9)


# Задание 4 Объявите в файле outputs.tf один output типа map, содержащий { instance_name = external_ip } для каждой из ВМ. Примените изменения.
	В качестве решения приложите вывод значений ip-адресов команды terraform output.

 Вывод terraform output 
 ```
root@dev:/home/isadm/DZ02/src# terraform output
vm_external_nat_ip_address = "158.160.96.219"
vm_web_external_nat_ip_address = "158.160.97.84"
root@dev:/home/isadm/DZ02/src#

```
# Задание 5
##    В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
	Добавил переменные с имененм ВМ в одном блоке locals.tf
 ```
 locals {
  name_local_vm_web = "${var.vm_web_name}"
  name_local_vm_db = "${var.vm_db_name}"
}
```    
##  Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.
   Заменил переменные 

```
resource "yandex_compute_instance" "netology-develop-platform-web" {
   name        = local.name_local_vm_web
#  name        = var.vm_web_name
  platform_id = var.vm_web_platform
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }  
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

```  

## Примените изменения.

	Принял изменения, в тогде изменений не было, что и следовало доказать 
```
root@dev:/home/isadm/DZ02/src# terraform plan
data.yandex_compute_image.ubuntu-2004-lts: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enpld3uvf0b932op4b4l]
data.yandex_compute_image.ubuntu-2004-lts: Read complete after 0s [id=fd8k54g2t50mekbk1ie1]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bf5eek12avu6e33mfl]
yandex_compute_instance.netology-develop-platform-db: Refreshing state... [id=fhm40b7vffcsomiu477t]
yandex_compute_instance.netology-develop-platform-web: Refreshing state... [id=fhm3eckf755411amv3nt]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
```

# Задание 6

  ##  Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в единую map-переменную vms_resources и внутри неё конфиги обеих ВМ в виде вложенного map.
	Собрал переменные в виде вложенного map 
 
```
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

```

### Создайте и используйте отдельную map переменную для блока metadata, она должна быть общая для всех ваших ВМ.

```
metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vm_username}:${var.vms_ssh_root_key}"
  }
```
Данные переменные используются для создания всех ВМ

### Найдите и закоментируйте все, более не используемые переменные проекта.
Закоментировал все неиспользуемые данные 
```
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
```
так же

```
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
```

## Проверьте terraform plan. Изменений быть не должно.
После выполнения видим, что изменений после введения переменных не было 

```
root@dev:/home/isadm/DZ02/src# terraform plan
data.yandex_compute_image.ubuntu-2004-lts: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enpld3uvf0b932op4b4l]
data.yandex_compute_image.ubuntu-2004-lts: Read complete after 1s [id=fd8k54g2t50mekbk1ie1]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bf5eek12avu6e33mfl]
yandex_compute_instance.netology-develop-platform-db: Refreshing state... [id=fhm40b7vffcsomiu477t]
yandex_compute_instance.netology-develop-platform-web: Refreshing state... [id=fhm3eckf755411amv3nt]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
root@dev:/home/isadm/DZ02/src#
```
