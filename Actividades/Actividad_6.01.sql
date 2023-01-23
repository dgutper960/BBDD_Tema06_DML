-- Actividad 6.1
-- Tema 6 - DML
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha 23/01/23


USE FUTBOL;

# Añadir 2 registros válidos en cada tabla de la base de datos fútbol mediante INSERT VALUE

INSERT INTO equipos VALUES
(null,'Los Chiquitos C.F.','Malagutes',300000,1969,'Málaga'),
(null,'Esparragos F.C.','La Jibe',15031,1880,'Ubrique Alto');

INSERT INTO jugadores VALUES
(null,'Gallardo','1975/11/1',6),
(null,'Terremoto','1985/03/02',6);

INSERT INTO partidos VALUES
(null, null, null,'2004/10/8 20:00:00',1,2,'Se aplazó al día siguiente'),
(null, null, null,'2004/7/8 21:00:00',2,0,'4 penaltis para el equipo de casa');

INSERT INTO goles VALUES 
(null,null,'00:9:00','Golazo de cabeza',1),
(null,null,'01:00:00','Carambola',16);












# Añadir 1 registro válido en cada tabla mediante INSERT SET