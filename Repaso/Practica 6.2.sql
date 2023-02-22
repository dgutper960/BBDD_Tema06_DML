-- Practica 6.2
-- David Gutiérrez Pérez

use futbol;

# 2. UPDATE (Actualizar registros)

-- Estadio de Villatrabuco pasa a llamarse Miraflores
update equipos set estadio = 'Miraflores' where equipos.nombre = 'Villatrabuco';

-- El estadio de Valdeajos tiene ahora una capacidad de 30000 espectadores
update equipos set aforo = '30000' where equipos.id = 4;

-- Todos los estadios sufren una merma de capacidad de 100 espectadores (reservas federativas)
update equipos set aforo = - 100;

-- El Athletic Formeñosa se funda 10 años más tarde


    /*  
        
        
        El Athletic Formeñosa se funda 10 años más tarde
        El jugador Diez Crespo ha fichado ahora por el Villatortas
        El jugador Julianillo nació finalmente el 8/4/1976.
        El partido entre el Villatrabuco y el Formeñosa quedó finalmente 3-1.