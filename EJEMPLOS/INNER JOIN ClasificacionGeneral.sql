-- Ejemplo INNER JOIN clasificacion general

use maratoon;


SELECT 
co.id,
co.Apellidos,
co.Nombre,
co.Edad,
cl.nombre AS Club,
ca.nombre AS Categoría
FROM
Corredores co
 INNER JOIN
 Clubs cl ON Co.club_id = Cl.id
INNER JOIN
 Categorias ca ON co.categoria_id = ca.id
ORDER BY co.apellidos ,co.nombre;

# Clasificacion general de la carrera carrera_id = 1
# Columnas:
# Corredores: id, apellidos, nombre, edad, sexo
# Refistro: TiempoInvertido
# Clubs: nombre
# CAtegoria: nombre
# Registro: TiempoInvertido

SELECT 
    corredores.id,
    corredores.Apellidos,
    corredores.Nombre,
    corredores.edad,
    corredores.sexo,
    corredores.categoria_id,
    registros.TiempoInvertido
FROM
    registros
        INNER JOIN
    corredores ON registros.corredor_id = corredores.id
    inner join categorias on corredores.Categoria_id = categorias.id
    inner join clubs on corredores.Club_id = clubs.id
WHERE
    carrera_id = 1 and Categoria_id = 7 order by TiempoInvertido limit 3;
