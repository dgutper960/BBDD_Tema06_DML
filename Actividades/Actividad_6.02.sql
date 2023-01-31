-- Actividad 6.2
-- Tema 6 - DML
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 30/01/23

use futbol;
-- 1. Estadio de Villatrabuco pasa a llamarse Miraflores
-- Para realizar una actualización uso el id del resgistro

UPDATE equipos 
SET 
    estadio = 'Miraflores'
WHERE
    id = 1 LIMIT 1; -- limit por medida de prevención
    

-- 2. El estadio de Valdeajos tiene ahora una capacidad de 30000 espectadores
UPDATE equipos 
SET 
    aforo = 30000
WHERE
    id = 4 LIMIT 1;
    
-- 3. Todos los estadios sufren una merma de capacidad de 100 espectadores (reservas federativas)
UPDATE equipos
SET aforo = - 100;


-- 4. El Athletic Formeñosa se funda 10 años más tarde
UPDATE equipos 
SET 
    fundacion = fundacion + 10 -- Buscar notaciones para modificar datos tipo fecha 
WHERE
    id = 3 LIMIT 1;
    
-- 5. El jugador Diez Crespo ha fichado ahora por el Villatortas
UPDATE jugadores 
SET 
    equipo_id = 2
WHERE
    id = 4 LIMIT 1;
    
-- 6. El jugador Julianillo nació finalmente el 8/4/1976
UPDATE jugadores 
SET 
    fecha_nac = '1976-4-8'
WHERE
    id = 6 LIMIT 1;
    
-- 7. El partido entre el Villatrabuco y el Formeñosa quedó finalmente 3-1
UPDATE partidos 
SET 
    goles_casa = 3,
    goles_fuera = 1
WHERE
    id = 2 LIMIT 1;









