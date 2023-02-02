-- Actividad 6.03
-- Tema 6 -DML
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha: 31/01/23

USE futbol;

# 1- Eliminar el jugador más veterano de la liga (sólo se podrá eliminar 1 jugador, usar ORDER BY y LIMIT)
DELETE FROM jugadores order by fecha_nac limit 1;

# 2- Eliminar todos los jugadores del Villatortas (identificar previamente el id de Villatortas)
DELETE FROM jugadores where equipo_id = 2;

# 3- Realizar el mismo ejercicio anterior, pero mediante una subconsulta (pedir ayuda al profesor)

-- Devuelve el id del equipo Villatortas F.C.
select id from equipos where nombre = 'Villatortas F.C.';

-- elimina todos los jugadores del equipo Villatortas

DELETE FROM jugadores WHERE equipo_id = (SELECT id FROM equipos);
 
# 4- Eliminar todos los jugadores que nacieron en 1970
select year(fecha_nac) FROM jugadores;
delete from jugadores where year(fecha_nac) = '1970';

# 5- Eliminar todos los goles marcados por el jugador Pacheco
select id from jugadores where nombre = 'Pacheco';
delete from goles where jugador_id = 12;

# 6- Realizar el mismo ejercicio anterior pero mediante una subconsulta
delete from goles where jugador_id = (select id from jugadores where nombre = 'Pacheco');

