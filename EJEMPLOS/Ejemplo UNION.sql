-- Ejemplo 70
-- UNION
-- Ejemplo 71
-- Mostrar todos los corredores de Ubrique y Villamartín ordenados 
-- alfabéticamente
-- usando el operador UNION.

use maratoon;

(SELECT 
id, Apellidos, Nombre, Ciudad
FROM
Corredores
WHERE
 Ciudad = 'Ubrique')UNION (SELECT 
id, Apellidos, Nombre, Ciudad
FROM
 Corredores
WHERE
 Ciudad = 'Villamartín')ORDER BY Apellidos,Nombre;