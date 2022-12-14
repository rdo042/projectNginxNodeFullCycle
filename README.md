# projectNginxNodeFullCycle

Para uso do projeto:
1. clone do projeto para a sua infraestrutura (necessário devido a base de dados)
2. docker-compose up -d

version: '3'

services:
  app:
    #build:  /home/ronal/aula_imagens/node
    image: orling/node:1
    container_name: app
    command: node index.js
    entrypoint: dockerize -wait tcp://db:3306 -timeout 20s docker-entrypoint.sh
    networks:
      - orlingnet
    #volumes:
    #  - /node:/usr/src/app
    tty: true
    ports:
      - "3000:3000"
    depends_on:
      - db

  db:
    image: mysql:5.7
    command: 
      --innodb-use-native-aio=0
    #  --init-file /docker-entrypoint-initdb.d/init.sql
    container_name: db
    # restart: always
    tty: true
    volumes: 
      - ./mysql:/var/lib/mysql
      - ./scripts/schema.sql:/docker-entrypoint-initdb.d/1.sql
      - ./scripts/data.sql:/docker-entrypoint-initdb.d/2.sql
    environment:
      MYSQL_ROOT_PASSWORD: root
    networks:
      - orlingnet

  nginx:
    image: orling/nginx-node:4
    container_name: nginx
    networks:
      - orlingnet
    ports:
      - "8080:80"
    depends_on:
      - app
      - db

networks:
  orlingnet:
    driver: bridge
