Задание 1
1. Скачал необходимые зависимости src 

2. При анализе файла .gitignore сохранять личную информацию допустимо в terraform-файле personal.auto.tfvars

3. Переменная random_password следующая: "result": "FrdthkyNOp7XV0OC",

4. При раскоментировании main.tf возникло 2 ошибки.
	- Первая ошибка говорит что все блоки должны состоять из 2ух аргументов (type, name)
	- Вторая говорит о том что название должно начинаться только с букв. 

5. root@devsorokin:/home/devsorokin/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
532237bd36cd   nginx:latest   "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   0.0.0.0:8000->80/tcp   tutorial

6 Данный ключ нужен для того чтобы автоматически принимать конфигурацию без его подтверждения вручную. Опасность применения заключается в том, что в случае ошибки в команде или конфиг файле 
изменения передадуться всем ВМ или сервисам в указанном диапазоне.

root@devsorokin:/home/devsorokin/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
48e99006bbde   nginx:latest   "/docker-entrypoint.…"   13 seconds ago   Up 13 seconds   0.0.0.0:8000->80/tcp   hello_world

7. Выполнил teraform destroy. Файл terraform.tfstate ниже
{
  "version": 4,
  "terraform_version": "1.5.7",
  "serial": 13,
  "lineage": "ad29f318-d480-d021-da32-73e8aab2e925",
  "outputs": {},
  "resources": [],
  "check_results": null
}

8. Docker image не удалился потому, что в main.tf мы указали хранить файл локально. 
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}
