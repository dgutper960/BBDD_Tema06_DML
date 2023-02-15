
use maratoon;

select * from corredores, clubs; -- > se obtiene el producto cartesiado de ambos (muestra registros mal relacionados)

select * from corredores, clubs where corredores.club_id = clubs.id; -- > Muestra solo los registros BIEN relacionados

# PARA CONECTAR DOS TABLAS CONECTO LA CLAVE AJENA DE UNA TABLA CON LA CLAVE PRINCIPAL DE LA OTRA
# Para una busqueda más exaustiva podríamos hacer lo siguiente

SELECT 
    corredores.id,
    corredores.apellidos,
    corredores.Sexo,
    corredores.Edad,
    clubs.Nombre as club, -- > aqui as 'club' será un alias
    corredores.Categoria_id
FROM
    corredores,
    clubs
WHERE
    corredores.club_id = clubs.id;
    
    # Usando el mismo listado que pero que solo muestre a las mujeres
    
    SELECT 
    corredores.id,
    corredores.apellidos,
    corredores.Sexo,
    corredores.Edad,
    clubs.Nombre AS club,
    corredores.Categoria_id
FROM
    corredores,
    clubs
WHERE
    corredores.club_id = clubs.id
        AND corredores.sexo = 'M'; -- > Usamos el operador 'AND'
        
        
 # Mismo ejemplo usandoo inner join
 
     SELECT 
    corredores.id,
    corredores.apellidos,
    corredores.Sexo,
    corredores.Edad,
    clubs.Nombre AS club,
    corredores.Categoria_id
FROM
    corredores
        INNER JOIN
    clubs ON corredores.club_id = clubs.id
WHERE
    corredores.sexo = 'M'; -- > Usamos WHERE para añadir condiciones
    
    # Siempre se asocia la clave ajena de un a tabla con la clave principal de la otra
    # Seleccionar el nombre del equipo de un jugador
    
    use futbol;
    
    SELECT 
    jugadores.nombre,
    equipos.nombre
FROM
    equipos, jugadores
WHERE
    jugadores.equipo_id = equipos.id;
    
    # Mismo ejemplo con el INNER JOIN
    -- BUscamos jugadores entre 1970 - 1990
    
        SELECT 
    jugadores.id,
    jugadores.nombre,
    jugadores.equipo_id,
    jugadores.fecha_nac,
    equipos.nombre
FROM
    jugadores
        INNER JOIN
    equipos ON jugadores.equipo_id = equipos.id
WHERE
    YEAR(jugadores.fecha_nac) BETWEEN '1970' AND '1990';

