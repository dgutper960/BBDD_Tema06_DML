-- Repaso - Tema 6 - DML
-- Scripts TEMARIO
-- 6.6 ConsultasBásicas: SELECT

## USAREMOS LA BBDD maratoon ##
use maratoon;

-- Actualizar la columna Tiempoinvertido de la tabla Registros,
-- a partir de las columnas Salida y Llegada.
UPDATE registros SET TiempoInvertido = TIMEDIFF(Llegada,Salida); -- > Observese la FUNCION TIMEDIFF

#### SENTENCIA SELECT ####
/* SINTAXIS COMPLETA PARA SENTNCIAS DE CONSULTAS SELECT
SELECT [ALL | DISTINCT] 
expre_colum1, expre_colum2, ...
FROM [table_name1, table_name2, …] 
[WHERE where_definition]              ---> EL ORDEN DE LAS SENTENCIAS ES ESENCIAL PARA EVITAR ERRORES
[GROUP BY {col_name | expr | position} 
[ASC | DESC], ... [WITH ROLLUP]] 
[HAVING where_definition] 
[ORDER BY {col_name | expr | position} 
[ASC | DESC] , ...] 
[LIMIT {[offset,] row_count | row_count OFFSET offset}] */

## EJEMPLOS CONSULTAS SELECT ##
-- Ejemplo 01 - Uso '*' en lista columnas
-- Muestra todas las columnas de la tabla corredores
SELECT * FROM corredores;

-- Ejemplo 02 - Espcificación de una lista de columnas
-- Muestra de la tabla corredor sólo las columnas especificadas en la lista
SELECT id, Apellidos, Nombre, Edad FROM corredores;


-- EJEMPLO 03
SELECT id, Apellidos, Nombre, categoría_id FROM corredores;

## CLAUSULA AS ## 
-- Ejemplo 04 - Cláusula AS 
-- Especificación de columnas con asignación de alias a algunas columnas
SELECT 
    Id AS Código, Apellidos, Nombre, club_id AS Club
FROM
    corredores;


-- Ejemplo 05 - Renombrar columnas sin AS
-- Veamos a continuación que la cláusula AS no es obligatoria
SELECT 
    id Código, Apellidos, Nombre, club_id Club
FROM
    corredores;

### PREFIJOS ###
-- Ejemplo 06 - Prefijos
-- En este ejemplo vemos que el prefijo nombre de tabla es obligatorio sólo 
-- para el campo Nombre, ya que dicha columna se repite en ambas tablas
SELECT 
    corredores.id,
    corredores.Nombre,
    corredores.Apellidos,
    carreras.Nombre,
    carreras.Ciudad
FROM
    corredores,
    carreras;


-- Ejemplo 07 - Prefijos con alias en las tablas
SELECT 
    co.id, co.Nombre, co.Apellidos, ca.Nombre, ca.Ciudad
FROM
    corredores AS co,
    carreras AS ca;


-- Ejemplo 08 - Expresiones en la lista de columnas (ERROR)
SELECT 
    id,
    CONCAT(Apellidos, ‘, ‘, Nombre) AS Nombre,
    YEAR(FechaNacimiento) AS 'Año Nacimiento',
    Edad
FROM
    corredores;
    
    
#### CLAUSULA FROM ####
-- Ejemplos Cláusula FROM

-- Ejemplo 09 - Prefijos con alias en las tablas
SELECT 
    co.id, co.Nombre, co.Apellidos, ca.Nombre, ca.Ciudad
FROM
    corredores AS co,
    carreras AS ca;


-- Ejemplo 10 - Prefijos con alias en las tablas omitiendo AS (ERROR)
SELECT 
    co.id, co.Nombre, co.Apellidos, ca.Nombre, ca.Ciudad
FROM
    corredores co,
    carreras ca;
    
#### CLAUSULA WHERE ####

-- Ejemplos cláusula WHERE con uso de operadores
--
-- Ejemplo 11
-- Corredores con 35 años de edad
SELECT * FROM corredores WHERE edad=35;


-- EJEMPLO 12
-- Corredores Masculinos con más de 30 años
SELECT * FROM corredores WHERE edad>30 AND sexo='M';


-- Ejemplo 13
-- Corredores de Villamartín, nacidos en el 1980
SELECT 
    *
FROM
    corredores
WHERE
    YEAR(fechanacimiento) = 1980
        AND Ciudad = 'Villamartín';


-- Ejemplo 14
-- Corredores Masculinos de la Categoría 5
SELECT 
    *
FROM
    corredores
WHERE
    Sexo = 'M' AND categoria_id = '5';


-- Ejemplo 15
-- Corredores que no tengan indicado el club al que pertenecen
SELECT * FROM CORREDOR WHERE club_id IS NULL;

#### CLAUSULA IN ####

/*SINTAXIS PARA IN 
Expresión [NOT] IN (Lista_Valores) */

-- Ejemplo 18
-- Corredores de la categoría 7, 8 y 5
SELECT 
    *
FROM
    corredores
WHERE
    categoria_id = 7 OR categoria_id = 8
        OR categoria_id = 5;


-- Ejemplo 19
-- Mismo ejercicio anterior pero usando el operador IN
SELECT * FROM corredores WHERE categoria_id IN (7, 8, 5);

#### CLAUSULA BETWEEN ####
/* SINTAXIS PARA OPERADOR BETWEEN (entre) --> Con NOT te busca 'los que no estén entre'
Expr [NOT] BETWEEN ValorInicial ADN ValorFinal */

-- Ejemplos Operador BETWEEN

-- Ejemplo 20 
-- Corredores entre 30 y 40 años ambos inclusives --> SIN EL OPERADOR BETWEEN
SELECT * FROM corredores WHERE Edad>= 30 AND Edad<=40;


-- Ejemplo 21
-- Mismo ejemplo anterior pero con el opeador BETWEEN
SELECT * FROM corredores WHERE Edad BETWEEN 30 AND 40;


-- Ejemplo 22
-- Corredores que no tengan entre 30 y 40 años
SELECT * FROM corredores WHERE Edad NOT BETWEEN 30 AND 40;


#### CLAUSULA LIKE ####
/* SINTAXIS PARA OPERADOR LIKE
Expr [NOT] LIKE ‘PatrónCaracteres’ */

-- Ejemplos Operador LIKE
-- Ejemplo 23
-- Seleccionar aquellos corredores cuyo nombre empiece por M
SELECT * FROM corredores WHERE nombre LIKE 'M%';


-- Ejemplo 24
-- seleccionar aquellos corredores que se apelliden Pérez
SELECT * FROM corredores WHERE apellidos LIKE '%Pérez%';


-- Ejemplo 25
-- Seleccionar aquellos corredores que sean de Ubrique y 
-- su primer apellido empiece por R
SELECT * FROM corredores WHERE Ciudad='Ubrique' and apellidos LIKE 'R%';


-- Ejemplo 26
-- Seleccionar aquellos corredores cuya 3 letra del nombre es una a
SELECT * FROM corredores WHERE nombre LIKE '__a%';


#### REGEXP y Expresiones Regulares ####  ---> Ver cuadro apuntes pág 21
-- Ejemplos REGEXP

-- Ejemplo 27
-- Selecciona aquellos corredores cuyo nombre comience por A.
SELECT * FROM Corredores WHERE Nombre REGEXP '^A';


-- Ejemplo 28
-- Selecciona aquellos corredores cuyo nombre finalice por a.
SELECT * FROM Corredores WHERE Nombre REGEXP 'a$';


-- Ejemplo 29
-- Selecciona aquellos corredores cuyo nombre comience por P o J.
SELECT * FROM Corredores WHERE Nombre REGEXP '^P|J';


-- Ejemplo 30
-- Selecciona aquellos corredores cuyo nombre contenga la cadena an.
SELECT * FROM Corredores WHERE Nombre REGEXP 'an.';


-- Ejemplo 31
-- Selecciona aquellos corredores cuyo nombre contenga una u y una a continuación o no
SELECT * FROM Corredores WHERE Nombre REGEXP 'ua*';


-- Ejemplo 32
-- Selecciona aquellos corredores cuyo nombre contenga la cadena jo
SELECT * FROM Corredores WHERE Nombre REGEXP 'jo+';


-- Ejemplo 33
-- Selecciona aquellos corredores cuyo nombre contenga la cadena ua o fa
SELECT * FROM Corredores WHERE Nombre REGEXP '(ua|fa)';


-- Ejemplo 34
-- Selecciona aquellos corredores cuyo nombre comience por Ju o Ev
SELECT * FROM Corredores WHERE Nombre REGEXP '^(Ju|Ev)';


-- Ejemplo 35
-- Selecciona aquellos corredores cuyo nombre contenga la secuencia j 
-- de dos a tres veces seguidas
SELECT * FROM Corredores WHERE Nombre REGEXP 'j{2,3}';


-- Ejemplo 36
-- Selecciona aquellos corredores cuyo nombre contenga d o una v
-- de dos a tres veces
SELECT * FROM Corredor WHERE Nombre REGEXP '[dv]';


-- Ejemplo 38
-- Selecciona aquellos corredores cuyo nombre no contega una a o una p
SELECT * FROM Corredores WHERE Nombre NOT REGEXP '[ap]';

#### Cláusula ORDER BY ####

/*SINTAXIS PARA ORDER BY
ORDER BY {Columna| Expresión | Posición} [ASC|DESC] */

-- Ejemplos cláusula ORDER BY

-- Ejemplo 39
-- Corredores ordenados por apellidos
SELECT * FROM corredores ORDER BY apellidos;


-- Ejemplo 40
-- Corredores ordenados por apellidos y luego por nombre
-- Mostrar id, Apellidos, Nombre, Ciudad y Edad
SELECT 
    id, Apellidos, Nombre, Ciudad, Edad
FROM
    corredores
ORDER BY apellidos, nombre;


-- Ejemplo 41
-- Mostrar corredores desde los más veteranos a los más jóvenes
SELECT 
    id, Apellidos, Nombre, Ciudad, Edad
FROM
    corredores
ORDER BY Edad DESC;


#### CLAUSULA LIMIT ####

/* SINTAXIS PARA LIMIT
[LIMIT {[offset,] row_count | row_count OFFSET offset}]   

* Offset. Indica el desplazamiento del primer registro a retornar
* Row_count. El número de registros a retornar.Si no se ha especificado Offset devuelve los Row_count primeros.
* row_count OFFSET offset. Se suele usar para mantener la compatibilidad con PostgreeSQL */ 

-- Ejemplos cláusula LIMIT

-- Ejemplo 42
-- Corredores ordenados por apellidos 3 primeros
SELECT * FROM corredores ORDER BY apellidos LIMIT 3;


-- Ejemplo 43
-- Corredores ordenados por apellidos y luego por nombre
-- Mostrar id, Apellidos, Nombre, Ciudad y Edad
-- A partir de los 2 primeros mostrar 5
SELECT 
    id, Apellidos, Nombre, Ciudad, Edad
FROM
    corredores
ORDER BY apellidos, nombre
LIMIT 2 , 5;  -- > A partir de los 2 primeros mostrar 5


-- EJEMPLO 44
-- Mismo resultado anterior con OFFSET
SELECT 
    id, Apellidos, Nombre, Ciudad, Edad
FROM
    corredores
ORDER BY apellidos , nombre
LIMIT 5 OFFSET 2; -- > A partir de los 2 primeros mostrar 5


-- Ejemplo 45
-- Mostrar los 5 corredores más veteranos
SELECT 
    id, Apellidos, Nombre, Ciudad, Edad
FROM
    corredores
ORDER BY Edad DESC  -- > Orden por defecto ascendente
LIMIT 5;


#### CLAUSULAS ALL y DISTINT ####
# ALL - Recuperamos todas las filas aunque algunas estén repetidas. Es la opción por omisión.
# DISTINCT –No recupera las filas repetidas.

-- Ejemplos con ALL o DISTINCT

-- Ejemplo 46
-- Muestra las poblaciones de los distintos corredores 
SELECT ALL ciudad FROM corredores;


-- Ejemplo 47
-- Mismo ejemplo anterior omitiendo ALL -- > Igualmente mostrará valores repetidos
SELECT ciudad FROM corredores;


-- Ejemplo 48
-- Muestra las poblaciones de los corredores, no mostrar las repetidas
SELECT DISTINCT ciudad FROM corredores;

##### EXPRESIONES ##### 

-- Ejemplo 49
-- Devuelve la fecha actual del sistema
SELECT CURRENT_DATE AS 'FECHA ACTUAL'; -- > Toma la fecha actual y le pone su alias 'FECHA ACTUAL'


-- Ejemplo 50
-- Devuelve la fecha y la hora actual del sistema
SELECT CURRENT_TIMESTAMP AS 'FECHA HORA ACTUAL';


-- Ejemplo 51
-- Devuelve la hora actual
SELECT CURRENT_TIME AS 'HORA ACTUAL';


#### FUNCIONES DE AGREGADO ####

# AVG: devuelve la media de los valores de una colección
# MAX: devuelve el valor máximo 
# MIN: devuelve el valor mínimo
# SUM: devuelve la suma 
# COUNT: devuelve el número de elementos que tiene la colección

/* SINTAXIS 
nom_Funcion ([DISTINCT] nom_columna) */

-- Ejemplos Funciones de Agregado

-- Ejemplo 52
-- Número de corredores de Ubrique
SELECT COUNT(*) FROM Corredores WHERE Ciudad='Ubrique';


-- Ejemplo 53
-- Edad media de todos los corredores
SELECT AVG(edad) FROM Corredores;  -- > Entre parentesis la columna sobre la que hace media la funcion AVG


-- Ejemplo 53
-- Edad máxima de los corredores de Villamartín
SELECT MAX(edad) FROM Corredores WHERE Ciudad='Villamartín';


-- Ejemplo 54
-- Edad mínima de los corredores de Arcos
SELECT MIN(edad) FROM Corredores WHERE Ciudad='Arcos';


-- Ejemplo 55
-- Suma de todos los socios de los club de Ubrique
SELECT SUM(NumSocios) FROM Clubs WHERE Ciudad='Ubrique';


-- Ejemplo 56
-- Edad Máxima, Mínima y Media de los Corredores de Ubrique
SELECT 
    'Edades Club Ubrique',
    MAX(Edad) AS EdadMAX,
    MIN(Edad) AS EdadMin,
    AVG(Edad) AS EdadMedia
FROM
    Corredores
WHERE
    Ciudad = 'Ubrique';
