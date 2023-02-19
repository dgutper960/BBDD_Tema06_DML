-- Ejemplo Left Join

use empresa;

# El inner join no muestra los empleados que no tienen departamento
SELECT empleados.id,
empleados.nombre,
empleados.apellidos,
empleados.departamento_id,
departamentos.nombre departamento,
departamentos.localizacion
FROM empleados 
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id;

 # Por eso hay que añadirle el left join
 SELECT empleados.id,
empleados.nombre,
empleados.apellidos,
empleados.departamento_id,
departamentos.nombre departamento,
departamentos.localizacion
FROM empleados 
left JOIN departamentos ON empleados.departamento_id = departamentos.id;
