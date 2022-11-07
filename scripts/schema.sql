CREATE DATABASE IF NOT EXISTS auladb;

USE auladb;

CREATE TABLE IF NOT EXISTS people (
    id integer not null auto_increment,
    name varchar(255),
    PRIMARY KEY (id)
);