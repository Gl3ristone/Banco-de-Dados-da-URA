CREATE TABLE trainer(
id INT PRIMARY KEY,
nome VARCHAR(50),
idade INT NOT NULL);

CREATE TABLE umamusume(
id INT PRIMARY KEY,
nome VARCHAR(30) NOT NULL UNIQUE,
peso INT NOT NULL,
altura INT NOT NULL,
nacionalidade VARCHAR(30) NOT NULL,
id_trainer INT NOT NULL,
FOREIGN KEY (id_trainer) REFERENCES trainer(id));

CREATE TABLE status(
id INT PRIMARY KEY,
id_umamusume INT NOT NULL UNIQUE,
speed INT NOT NULL,
stamina INT NOT NULL,
power INT NOT NULL,
guts INT NOT NULL,
wits INT NOT NULL,
skill_points INT NOT NULL,
FOREIGN KEY (id_umamusume) REFERENCES umamusume(id));

CREATE TABLE propensoes(
id INT PRIMARY KEY,
id_umamusume INT NOT NULL UNIQUE,
sprint VARCHAR(1) NOT NULL,
milha VARCHAR(1) NOT NULL,
medio VARCHAR(1) NOT NULL,
longa VARCHAR(1) NOT NULL,
front_runner VARCHAR(1) NOT NULL,
pace_chaser VARCHAR(1) NOT NULL,
late_surger VARCHAR(1) NOT NULL,
end_closer VARCHAR(1) NOT NULL,
turf VARCHAR(1) NOT NULL,
dirt VARCHAR(1) NOT NULL,
FOREIGN KEY (id_umamusume) REFERENCES umamusume(id));

CREATE TABLE skill(
id INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL UNIQUE,
raridade VARCHAR(6) NOT NULL,
tipo VARCHAR(10) NOT NULL);

CREATE TABLE uma_skill(
id_umamusume INT,
id_skill INT,
PRIMARY KEY(id_umamusume,id_skill),
FOREIGN KEY (id_umamusume) REFERENCES umamusume(id),
FOREIGN KEY (id_skill) REFERENCES skill(id));

CREATE TABLE corrida(
id INT PRIMARY KEY,
nome VARCHAR(25) NOT NULL,
grau VARCHAR(30) NOT NULL,
ano INT NOT NULL,
localizaçao VARCHAR(30) NOT NULL,
tipo_de_pista VARCHAR(4) NOT NULL,
distancia VARCHAR(10) NOT NULL,
total_de_participantes INT NOT NULL);

CREATE TABLE carreira(
id_umamusume INT NOT NULL,
id_corrida INT NOT NULL,
posiçao INT NOT NULL,
PRIMARY KEY(id_umamusume, id_corrida, posiçao),
FOREIGN KEY (id_umamusume) REFERENCES umamusume(id),
FOREIGN KEY (id_corrida) REFERENCES corrida(id));
