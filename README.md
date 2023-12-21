# Задача 1 

ссылка на созданый docker hub
https://hub.docker.com/repository/docker/iosorokin/deviosorokin 


## Задача 2

	Высоконагруженное монолитное Java веб-приложение; Монолитное приложение лучше равернуть на виртуальной машине так как оно и так монолитное и все при установке в него уже входит
	Nodejs веб-приложение; Лучше на docker так как это веб приложение его будет проще распространять, и быстро восстановить в случае сбоя.
	Мобильное приложение c версиями для Android и iOS; подойдет docker так как новую версию проще деплоить. 
	Шина данных на базе Apache Kafka; Так как это шина данных взаимодействие будет быстрее на физической машине.
	Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana; Лучше использовать виртуальную машину, 
так как контенер не сможет предоставить такой скорости обработки логов как виртуальная машина
	Мониторинг-стек на базе Prometheus и Grafana; Можно развернуть в докер контейнере так как обновление редкое. 
	MongoDB как основное хранилище данных для Java-приложения; Как физическая так и виртуальная машина, так как возможны большие объемы информации и лучше использовать виртуальную машину
	Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry. Развернуть лучше на docker, спокойно работает в контейнере.
	
	
	
Задача 3

Создаем докер контейнер с подмапленной внутренней папкой /data

docker run -d -v /data:/data centos sleep infinity

Входим в фируальную машину под bash

root@isadm-Virtual-Machine:/# docker exec -it ee77c973a016 bash

Видим, что папка примаплена

[root@ee77c973a016 /]# ls -la
total 60
drwxr-xr-x   1 root root 4096 Nov 29 13:24 .
drwxr-xr-x   1 root root 4096 Nov 29 13:24 ..
-rwxr-xr-x   1 root root    0 Nov 29 13:24 .dockerenv
lrwxrwxrwx   1 root root    7 Nov  3  2020 bin -> usr/bin
drwxr-xr-x   2 root root 4096 Nov 29 13:07 data
drwxr-xr-x   5 root root  340 Nov 29 13:24 dev
drwxr-xr-x   1 root root 4096 Nov 29 13:24 etc
drwxr-xr-x   2 root root 4096 Nov  3  2020 home
lrwxrwxrwx   1 root root    7 Nov  3  2020 lib -> usr/lib
lrwxrwxrwx   1 root root    9 Nov  3  2020 lib64 -> usr/lib64
drwx------   2 root root 4096 Sep 15  2021 lost+found
drwxr-xr-x   2 root root 4096 Nov  3  2020 media
drwxr-xr-x   2 root root 4096 Nov  3  2020 mnt
drwxr-xr-x   2 root root 4096 Nov  3  2020 opt
dr-xr-xr-x 359 root root    0 Nov 29 13:24 proc
dr-xr-x---   2 root root 4096 Sep 15  2021 root
drwxr-xr-x  11 root root 4096 Sep 15  2021 run
lrwxrwxrwx   1 root root    8 Nov  3  2020 sbin -> usr/sbin
drwxr-xr-x   2 root root 4096 Nov  3  2020 srv
dr-xr-xr-x  13 root root    0 Nov 29 13:24 sys
drwxrwxrwt   7 root root 4096 Sep 15  2021 tmp
drwxr-xr-x  12 root root 4096 Sep 15  2021 usr
drwxr-xr-x  20 root root 4096 Sep 15  2021 var

Создаем необходимый файл
[root@ee77c973a016 /]# echo '' > /data/centos-new

Видно что папка создана
[root@ee77c973a016 /]# ls /data/
centos-new
[root@ee77c973a016 /]#

Сделал то же самое с Debian 

``` root@isadm-Virtual-Machine:/# docker run -d -v /data:/data debian sleep infinity
9586653bb4b42760048493682c1e895d6df035a5dbecc88558501f3fafebaefd
root@isadm-Virtual-Machine:/# docker ps -a
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS     NAMES
9586653bb4b4   debian    "sleep infinity"   8 minutes ago    Up 8 minutes              intelligent_carson
ee77c973a016   centos    "sleep infinity"   23 minutes ago   Up 23 minutes             nice_hermann
root@isadm-Virtual-Machine:/# docker exec -it 9586653bb4b4 bash
root@9586653bb4b4:/#
root@9586653bb4b4:/#
root@9586653bb4b4:/#
root@9586653bb4b4:/# ls -la
total 60
drwxr-xr-x   1 root root 4096 Nov 29 13:40 .
drwxr-xr-x   1 root root 4096 Nov 29 13:40 ..
-rwxr-xr-x   1 root root    0 Nov 29 13:40 .dockerenv
lrwxrwxrwx   1 root root    7 Nov 20 00:00 bin -> usr/bin
drwxr-xr-x   2 root root 4096 Sep 29 20:04 boot
drwxr-xr-x   2 root root 4096 Nov 29 13:27 data
drwxr-xr-x   5 root root  340 Nov 29 13:40 dev
drwxr-xr-x   1 root root 4096 Nov 29 13:40 etc
drwxr-xr-x   2 root root 4096 Sep 29 20:04 home
lrwxrwxrwx   1 root root    7 Nov 20 00:00 lib -> usr/lib
lrwxrwxrwx   1 root root    9 Nov 20 00:00 lib32 -> usr/lib32
lrwxrwxrwx   1 root root    9 Nov 20 00:00 lib64 -> usr/lib64
lrwxrwxrwx   1 root root   10 Nov 20 00:00 libx32 -> usr/libx32
drwxr-xr-x   2 root root 4096 Nov 20 00:00 media
drwxr-xr-x   2 root root 4096 Nov 20 00:00 mnt
drwxr-xr-x   2 root root 4096 Nov 20 00:00 opt
dr-xr-xr-x 353 root root    0 Nov 29 13:40 proc
drwx------   2 root root 4096 Nov 20 00:00 root
drwxr-xr-x   3 root root 4096 Nov 20 00:00 run
lrwxrwxrwx   1 root root    8 Nov 20 00:00 sbin -> usr/sbin
drwxr-xr-x   2 root root 4096 Nov 20 00:00 srv
dr-xr-xr-x  13 root root    0 Nov 29 13:40 sys
drwxrwxrwt   2 root root 4096 Nov 20 00:00 tmp
drwxr-xr-x  14 root root 4096 Nov 20 00:00 usr
drwxr-xr-x  11 root root 4096 Nov 20 00:00 var
root@9586653bb4b4:/# echo '1' > /data/debian-file
root@9586653bb4b4:/# ls /data/
centos-new  debian-file
```
root@9586653bb4b4:/# cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@9586653bb4b4:/#
