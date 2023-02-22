-- Practica 6.1
-- David Gutiérrez Pérez

use futbol;

# 1. INSERT (insertar registros)

	/*  Añadir 2 registros válidos en cada tabla de la base de datos fútbol mediante INSERT VALUE
        Añadir 1 registro válido en cada tabla mediante INSERT SET */
        

insert into equipos values(
null,
'Los Gazpachos FC',
'Luis Buñuel Stadium',
25000,
1995-02-13,
'Albacete'
),(
null,
'El peñón de la Becerra AD',
'LO DE LA PACA',
35,
202-06-14,
'Ubrique'
);

insert into goles values(
null,
5,
'01:01:01',
'La peinó magistralmente',
5
);

insert into jugadores values(
null,
'Abelardo',
1985/12/03,
6
);

insert into partidos values(
null,
5,
6,
1999/10/31,
2,
3,
'El árbitro se fue a coger esparragos porque estaba el día bueno');

insert into jugadores set
nombre = 'Antonio',
equipo_id = 4;
