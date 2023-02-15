-- Actividad_6.5
-- Tema 6 - DML
-- Curso 1DAW
-- Autor: David gutiérrez Pérez
-- Fecha 09/02/23


# Para la realización de esta actividad, usaremos la base de datos futbol
USE futbol;

# 1. Consultas Básicas
# Listado de todos los jugadores
SELECT * FROM jugadores;

# Listado de todos los equipos
SELECT * FROM equipos;

# Listado de todos los partidos
SELECT * FROM partidos;

# Listado de los tres últimos partidos disputados
SELECT * FROM partidos ORDER BY fecha desc LIMIT 3;


# 2. Consultas con LIMIT
# Listado de los 5 goles más tempranos
SELECT * FROM goles ORDER BY minuto limit 5;

# Listado de goles del 5 al 10
SELECT * FROM goles ORDER BY id LIMIT 4,6;

# Listado de los tres últimos partidos disputados
SELECT * FROM partidos ORDER BY fecha DESC LIMIT 3;

# Listado de sólo 1 partido donde intervino Villatortas como equipo de fuera
SELECT * FROM partidos WHERE id_equipo_fuera=2 LIMIT 1;

# Listado de 1 partido donde el equipo de fuera no marcó
SELECT * FROM partidos WHERE goles_fuera=0 LIMIT 1;

# Listar 5 goles a partir del gol 4
SELECT * FROM goles ORDER BY id LIMIT 4,5;



# 3. Consultas (lista columnas)
# Mostrar el id, nombre y id_equipo de todos los jugadores
SELECT id, nombre, equipo_id FROM jugadores;

# Mostrar la misma consulta anterior pero asignando los siguientes alias: Numero, Nombre Jugador y Código Equipo. Usar cláusula AS 12.
SELECT id AS Numero, nombre AS NombreJugador, equipo_id AS CodigoEquipo FROM jugadores;

# Mostrar la misma consulta anterior pero sin usar la cláusula AS. (No se debe pero para comprobar que dicha cláusula es opcional) 
SELECT id Numero, nombre NombreJugador, equipo_id CodigoEquipo FROM jugadores;

# Mostrar la misma consulta anterior pero usando los prefijos del nombre de la tabla para la especificación de las columnas
SELECT jugadores.id Numero, jugadores.nombre NombreJugador, jugadores.equipo_id CodigoEquipo FROM jugadores;

# Mostrar la misma consulta anterior pero usando el prefijo del nombre de la base de datos y del nombre de la tabla, en la especificación de listas de columnas
SELECT jugadores.id Numero, jugadores.nombre NombreJugador, jugadores.equipo_id CodigoEquipo FROM futbol.jugadores;

# Realizar una consulta que me permita obtener el siguiente cálculo (32 + (0,33 * 10))/4
SELECT (32 + (0.33 * 10))/4 AS resultado;



# 4. Con predicados (WHERE)
# Mostrar todos los jugadores del equipo 1
SELECT * FROM jugadores WHERE equipo_id=1;

# Mostrar el jugador del equipo 1 cuyo id_jugador es el 9
SELECT * FROM jugadores WHERE equipo_id=1 AND id=9;

# Mostrar los tres jugadores más jóvenes del equipo 2
SELECT * FROM jugadores WHERE equipo_id=2 ORDER BY fecha_nac DESC LIMIT 3;

# Mostrar los equipos con el estadio de capacidad superior a 10000 espectadores
SELECT * FROM equipos WHERE aforo>10000;

# Mostrar los equipos con estadios de capacidad superior a 12000 espectadores y su fundación posterior al año 1970.
SELECT * FROM equipos WHERE aforo>12000 AND fundacion>1970;

# Goles marcados por el jugador 1
SELECT * FROM goles WHERE jugador_id=1;

# Goles marcados por el jugador 1 y  jugando como local (ver equipo al que pertenece el jugador 1).
SELECT * FROM goles WHERE jugador_id=1 AND id_partido IN (SELECT id FROM partidos WHERE id_equipo_casa=1);

# Comprobar si hay algún jugador que se llame Pacheco
SELECT * FROM jugadores WHERE nombre LIKE '%Pacheco%';

# Comprobar si algún jugador del equipo 1 se llama Fonseca
SELECT * FROM jugadores WHERE equipo_id=1 AND nombre LIKE '%Fonseca%';

# Obtener todos los partidos ganados en casa por el equipo 1
SELECT * FROM partidos WHERE id_equipo_casa=1 AND goles_casa>goles_fuera;

# Obtener todos los partidos ganados por el equipo local
SELECT * FROM partidos WHERE goles_casa>goles_fuera;

# Obtener todos los partidos acabados en empate
SELECT * FROM partidos WHERE goles_casa=goles_fuera;

# Obtener todos los partidos ganados por el equipo visitante
SELECT * FROM partidos WHERE goles_casa<goles_fuera;

# Obtener todos los partidos donde se haya ganado por más de 1 gol de diferencia.
SELECT * FROM partidos WHERE ABS(goles_casa-goles_fuera) > 1;


# 5. Operadores IN, BETWEEN, LIKE
# Seleccionar aquellos jugadores de los siguientes equipos: Villatrabuco, Villatorta y Valdeajos.
SELECT * FROM jugadores WHERE equipo_id IN (1,2,4);

# Selecciona aquellos equipos con capacidad de estadio entre 20.000 y 40.000 espectadores.
SELECT * FROM equipos WHERE aforo BETWEEN 20000 AND 40000;

# Selecciona aquellos equipos cuyo estadio no tenga menos de 30.000 espectadores de capacidad
SELECT * FROM equipos WHERE aforo >= 30000;

# Selecciona aquellos jugadores nacidos entre el 1970 y 1973
SELECT * FROM jugadores WHERE YEAR(fecha_nac) BETWEEN 1970 AND 1973;

# Selecciona aquellos jugadores cuyo nombre empiece por "D"
SELECT * FROM jugadores WHERE nombre LIKE 'D%';

# Selecciona el jugador llamado Macarena
SELECT * FROM jugadores WHERE nombre LIKE '%Mercena%';


# Con criterios de ordenación (ORDER BY)
# Obtener los los jugadores por orden alfabético de forma descendete
SELECT * FROM jugadores ORDER BY nombre DESC; 

# Obtener los equipos ordenados por el estadio de mayor a menor aforo
SELECT * FROM equipos ORDER BY aforo DESC;

# Obtener los jugadores ordenados por equipo y luego por nombre
SELECT * FROM jugadores ORDER BY equipo_id, nombre;

# Obtener los jugadores del equipo 1 ordenados por fecha de nacimiento desde el más veterano al mas joven.
SELECT * FROM jugadores WHERE equipo_id=1 ORDER BY fecha_nac ASC;

# Obtener los jugadores del equipo 2 ordenados por fecha de nacimiento desde el más joven al mas veterano.
SELECT * FROM jugadores WHERE equipo_id=2 ORDER BY fecha_nac DESC;

