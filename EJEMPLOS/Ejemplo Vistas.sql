-- > Las vistas van asociadas a una consulta
-- > El contenido de la vista es el resultado de una busqueda
-- > Una vez creada la vista se puede usar como una tabla

use maratoon;

CREATE OR REPLACE VIEW Clasificacion AS
 SELECT 
 co.id,
 co.Apellidos,
 co.Nombre,
 co.Edad,
 cl.nombre AS Club,
 ca.nombre AS Categoria,
 r.tiempoinvertido
 FROM
 Corredores co
 INNER JOIN
 Clubs cl ON co.club_id = cl.id
 INNER JOIN
 categorias ca ON co.categoria_id = ca.id
 INNER JOIN
 registros r ON r.corredor_id = co.id
 WHERE
 r.carrera_id = 1
 ORDER BY tiempoinvertido;
 
 SELECT * FROM maratoon.clasificacion;

# Ahora se puede usar este script como una tabla y hacer otra busqueda

# Devuelve los 3 primero de la clasificacion
select * from clasificacion limit 3;

# Devuelve la clasificacion de Veteranos A
select * from clasificacion where categoria = 'Veteranos A';

# Buscar corredores de cada categoría 
select categoria, count(*) num_corredores from clasificacion group by categoria;

