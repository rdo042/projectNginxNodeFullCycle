USE auladb;

CREATE TABLE IF NOT EXISTS people (
    id integer not null auto_increment,
    name varchar(255),
    PRIMARY KEY (id)
);

INSERT INTO people (name) VALUES ('Ronaldo');
INSERT INTO people (name) VALUES ('Renato');
INSERT INTO people (name) VALUES ('Juca');
INSERT INTO people (name) VALUES ('Adamastor');
INSERT INTO people (name) VALUES ('Junior');
 
