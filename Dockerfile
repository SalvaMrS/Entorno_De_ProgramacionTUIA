FROM ubuntu
MAINTAINER Sanchez Salvador Nicolás TUIA - EDP

RUN apt-get update && apt-get upgrade -y && apt-get install bc locales -y

RUN sed -i '/es_AR.UTF-8/ s/^# //g' /etc/locale.gen && locale-gen

ADD [ "Guia.txt", "Menu.sh", "/usr/src/" ]
ADD [ "Archivos", "/usr/src/Archivos/" ]
ADD [ "Scripts", "/usr/src/Scripts/" ]

WORKDIR /usr/src/

ENTRYPOINT ["bash", "Menu.sh"]
