-- Ejemplo Right Join

use empresa;

# Los empleados que no tienen departamento no salen
# Los departamentos que no tienen empleados no salen
SELECT empleados.id,
empleados.apellidos,
empleados.departamento_id,
departamentos.nombre,
departamentos.localizacion
FROM empleados 
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id;

# Muestra los no realcionado por la parte izquierda
SELECT empleados.id,
empleados.apellidos,
empleados.departamento_id,
departamentos.nombre,
departamentos.localizacion
FROM empleados 
left JOIN departamentos ON empleados.departamento_id = departamentos.id;

# Muestra los no realcionado por la parte derecha
SELECT empleados.id,
empleados.apellidos,
empleados.departamento_id,
departamentos.nombre,
departamentos.localizacion
FROM empleados 
right JOIN departamentos ON empleados.departamento_id = departamentos.id;

# Muestra los no realcionado por la parte izquierda y derecha (por el momento da error)
SELECT empleados.id,
empleados.apellidos,
empleados.departamento_id,
departamentos.nombre,
departamentos.localizacion
FROM empleados 
full JOIN departamentos ON empleados.departamento_id = departamentos.id;