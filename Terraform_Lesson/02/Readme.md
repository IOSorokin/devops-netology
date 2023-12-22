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

## 7. Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.

Параметр preemptible = true (Прерываемые ВМ) Это машины которые могут быть остановлены в любой момент, а именно:
		1. Если с момента старта машины прошло 24 часа
		2. Если вознкла нехватка ресурсов
Прерываемые ВМ полезны тем что они как правило дешевле, и в случаях если ресурсы ограничены. 
core_fraction=5 могут пригодится для ограничения производительности если это необходимо, соответственно экономятся важные ресурсы облака. (Зачем использовать машину на 100% если в этом нет необходимости в некоторых случаях).

Фото личного кабинета с созданной виртуальной машиной
![изображение](https://github.com/IOSorokin/devops-netology/assets/148979909/efb3ef1f-2324-410e-a79b-80702a778848)

