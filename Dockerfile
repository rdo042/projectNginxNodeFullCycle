FROM mysql:5.7

WORKDIR /var/lib/mysql

COPY /mysql/. .
