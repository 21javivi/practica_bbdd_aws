CREATE DATABASE IF NOT EXISTS salud;

USE salud;

CREATE TABLE IF NOT EXISTS usuario(
dni VARCHAR(9) NOT NULL,
nombre VARCHAR(20) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
fechaNacimiento DATE,
genero ENUM('M','H'),
PRIMARY KEY(dni)
);

CREATE TABLE IF NOT EXISTS comida(
    dni VARCHAR(9) NOT NULL,
    plato VARCHAR(15) NOT NULL,
    fechaComida DATE NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    calorias INT(4),
    PRIMARY KEY(dni, fechaComida, tipo),
    FOREIGN KEY (dni) REFERENCES usuario(dni)
);


CREATE TABLE IF NOT EXISTS total(
dni VARCHAR(9) NOT NULL,
fechaComida DATE NOT NULL,
caloriasTotales INT(5),
mensaje VARCHAR(40),
FOREIGN KEY (dni) REFERENCES usuario(dni)
);