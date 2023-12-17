Задание 1

1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
	Я скачал необходимые зависимости src.

2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?
	При анализе файла .gitignore сохранять личную информацию допустимо в terraform-файле personal.auto.tfvars

3. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
	В коде переменная random_password следующая: "result": "FrdthkyNOp7XV0OC",

5. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
	 При раскоментировании main.tf возникло 2 ошибки.
	- Первая ошибка говорит что все блоки должны состоять из 2ух аргументов (type, name)
	- Вторая говорит о том что название должно начинаться только с букв. 

6. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
'''
 	root@devsorokin:/home/devsorokin/ter-homeworks/01/src# docker ps
	CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
	532237bd36cd   nginx:latest   "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   0.0.0.0:8000->80/tcp   tutorial
'''   
6. Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.
	Данный ключ нужен для того чтобы автоматически принимать конфигурацию без его подтверждения вручную. Опасность применения заключается в том, что в случае ошибки в команде или конфиг файле 
	изменения передадуться всем ВМ или сервисам в указанном диапазоне.

	root@devsorokin:/home/devsorokin/ter-homeworks/01/src# docker ps
	CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
	48e99006bbde   nginx:latest   "/docker-entrypoint.…"   13 seconds ago   Up 13 seconds   0.0.0.0:8000->80/tcp   hello_world

7. Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
 Выполнил teraform destroy. Файл terraform.tfstate ниже
{
  "version": 4,
  "terraform_version": "1.5.7",
  "serial": 13,
  "lineage": "ad29f318-d480-d021-da32-73e8aab2e925",
  "outputs": {},
  "resources": [],
  "check_results": null
}

8. Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ обязательно подкрепите строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )
 Docker image не удалился потому, что в main.tf мы указали хранить файл локально. 
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}
