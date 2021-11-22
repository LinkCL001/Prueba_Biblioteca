--En la biblioteca se guardan los siguientes datos para cada préstamo que se realiza: los
--datos del libro (ISBN, título, número de páginas, código del autor, nombre y apellido del autor,
--fecha de nacimiento y muerte del autor, tipo de autor (principal, coautor)), datos del
--préstamo (fecha de inicio, fecha esperada de devolución y fecha real de devolución) y los
--datos del socio (rut, nombre, apellido, dirección y teléfono).Además, se deben considerar las siguientes restricciones:
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
--2. Se deben insertar los registros en las tablas correspondientes (1 punto).
--3. Realizar las siguientes consultas:
--a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)
--b. Mostrar todos los autores que hayan nacido después del 01-01-1970. (0.5 puntos)
--c. ¿Cuál es el libro más solicitado? (0.5 puntos).
--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días. (0.5 puntos)
