-- En la biblioteca se guardan los siguientes datos para cada préstamo que se realiza: los
-- datos del libro (ISBN, título, número de páginas, código del autor, nombre y apellido del autor,
-- fecha de nacimiento y muerte del autor, tipo de autor (principal, coautor)), 

-- datos del préstamo (fecha de inicio, fecha esperada de devolución y fecha real de devolución) y los
-- datos del socio (rut, nombre, apellido, dirección y teléfono).Además, se deben considerar las siguientes restricciones:
-- Se registra una única dirección y teléfono para cada socio.
-- El ISBN (International Standard Book Number), es un número de 13 cifras que identifica de una manera única a cada libro o producto de editorial publicado.
-- Para este ejercicio, asumirá que la biblioteca posee un ejemplar de cada libro.
-- El número único del autor es un correlativo interno que maneja la biblioteca para identificarlos y facilitar la búsqueda.
-- Un libro tiene al menos un autor principal, puede tener además registrado un coautor.
-- Un socio sólo puede pedir un libro a la vez.


--Parte 1 - Creación del modelo conceptual, lógico y físico
--1. Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas.(1 Punto)
--2. Realizar el modelo lógico, considerando todas las entidades y las relaciones entre ellas, los atributos, normalización y creación de tablas intermedias de ser necesario.(2 Puntos)
--3. Realizar el modelo físico, considerando la especificación de tablas y columnas,además de las claves externas. (2 Puntos)


--Parte 2 - Creando el modelo en la base de datos
--1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos. (2 puntos).

CREATE DATABASE biblioteca;

CREATE TABLE socios(
    rut VARCHAR(9),
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    PRIMARY KEY (rut)
);
CREATE TABLE libros(
    isbn VARCHAR(15),
    titulo VARCHAR(50),
    pag INT,
    dias_de_prestamo INT,
    PRIMARY KEY (isbn)
);
CREATE TABLE prestamos(
    socio VARCHAR(20) REFERENCES socios (rut),
    libro VARCHAR(20) REFERENCES libros (isbn),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    PRIMARY KEY (socio, libro)
);
CREATE TABLE autores(
    cod_autor INT,
    nombre_autor VARCHAR(20),
    apellido_autor VARCHAR(20),
    nacimiento VARCHAR(10),
    muerte VARCHAR(10),
    tipo_autor VARCHAR(20),
    PRIMARY KEY (cod_autor)
);
CREATE TABLE libros_autores(
    cod_autor INT REFERENCES autores (cod_autor),
    isbn VARCHAR(15) REFERENCES libros (isbn)
);
--2. Se deben insertar los registros en las tablas correspondientes (1 punto).

INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES (1111111-1, 'JUAN','SOTO','AVENIDA 1, SANTIAGO', '911111111'),
(2222222-2, 'ANA','PÉREZ','PASAJE 2, SANTIAGO', '922222222'),
(3333333-3, 'SANDRA','AGUILAR','AVENIDA 2, SANTIAGO', '933333333'),
(4444444-4, 'ESTEBAN','JEREZ','AVENIDA 3, SANTIAGO', '944444444'),
(5555555-5, 'SILVANA','MUÑOZ','PASAJE 3, SANTIAGO', '955555555');

INSERT INTO libros (isbn, titulo, pag, dias_de_prestamo)
VALUES (111-1111111-111,'CUENTOS DE TERROR', 344,'7'),
(222-2222222-222,'POESÍAS CONTEMPORANEAS', 167,'7'),
(333-3333333-333,'HISTORIA DE ASIA', 511,'14'),
(444-4444444-444,'MANUAL DE MECÁNICA', 298,'14');

INSERT INTO autores(cod_autor, nombre_autor, apellido_autor, nacimiento, muerte, tipo_autor)
VALUES(3 ,'JOSE','SALGADO','1968','2020','PRINCIPAL'),
(4 ,'ANA','SALGADO','1972', NULL,'COAUTOR'),
(1 ,'ANDRÉS','ULLOA','1982', NULL,'PRINCIPAL'),
(2 ,'SERGIO','MARDONES','1950','2012','PRINCIPAL'),
(5 ,'MARTIN','PORTA','1976', NULL, 'PRINCIPAL');

INSERT INTO libros_autores(cod_autor, isbn)
VALUES(3, 111-1111111-111),
(4, 111-1111111-111);

INSERT INTO prestamos (socio, libro, fecha_prestamo, fecha_devolucion)
VALUES (1111111-1, 111-1111111-111, '20-01-2020','27-01-2020'),
(5555555-5, 222-2222222-222, '20-01-2020','30-01-2020'),
(3333333-3, 333-3333333-333, '22-01-2020','30-01-2020'),
(4444444-4, 222-2222222-222, '23-01-2020','30-01-2020'),
(2222222-2, 222-2222222-222, '27-01-2020','04-02-2020'),
(1111111-1, 444-4444444-444, '31-01-2020','12-02-2020'),
(3333333-3, 222-2222222-222, '31-01-2020','12-02-2020');

--3. Realizar las siguientes consultas:
--a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)

SELECT * FROM libros WHERE pag < 300;

--b. Mostrar todos los autores que hayan nacido después del 01-01-1970. (0.5 puntos)

SELECT * FROM autores WHERE nacimiento >= '1970';

--c. ¿Cuál es el libro más solicitado? (0.5 puntos).

SELECT libro FROM prestamos GROUP BY libro ORDER BY solicitado DESC LIMIT 1;

--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días. (0.5 puntos)
