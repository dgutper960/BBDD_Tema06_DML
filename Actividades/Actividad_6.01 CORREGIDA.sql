-- Actividad 6.1
-- Tema 6 - DML
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha 23/01/23


USE futbol;

# Añadir 2 registros válidos en cada tabla de la base de datos fútbol mediante INSERT VALUE

INSERT INTO equipos VALUES
(5,'Los Chiquitos C.F.','Malagutes',300000,1969,'Málaga'),
(6,'Esparragos F.C.','La Jibe',15031,1880,'Ubrique Alto');

INSERT INTO jugadores VALUES
(45,'Gallardo','1975/11/1',6),
(46,'Terremoto','1985/03/02',6);

INSERT INTO partidos VALUES
(7, 4, 2,'20012/4/6 21:30:00',0,3,'El equipo local tuvo un mal día, no habían dormido bien'),
(8, 3, 1,'2008/12/18 19:45:00',2,2,'Golazo del empate, equipo visitante, en el ultimo minuto');

INSERT INTO goles VALUES 
(null,7,'00:31:09','Jugada individual',10),
(null,8,'01:34:55','Tiro desde el centro del campo',16);


INSERT INTO equipos SET
	nombre = 'Cornicabra F.C.',
    estadio = 'Plazoleta Cornicabra',
    aforo = 15,
    fundacion = '1985',
    ciudad = 'Ubrique';
    
INSERT INTO goles SET
	id_partido = 6,
    minuto = '00:15:49',
    descripcion = 'Gol con magnífica asistencia del capitán',
    jugador_id = '2';
    
insert into jugadores SET
	nombre = 'Silvestre',
    fecha_nac = '1994/12/21',
    equipo_id = '6';
    
insert  into partidos SET
	id_equipo_casa = 5,
    id_equipo_fuera = 7,
    fecha = '2023/01/18 20:45:00',
    goles_casa = 1,
    goles_fuera = 1,
    observaciones = 'Los jugadores del Cornicabra F.C. demostrarón defender muy bien fuera de casa, merecieron algo más que el empate';
    














# Añadir 1 registro válido en cada tabla mediante INSERT SET