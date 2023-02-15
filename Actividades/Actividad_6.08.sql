-- Actividad 6.8
-- Tema 6 - DML
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 14/02/23

use empresa;


# 1. Consultas multitablas. (WHERE)

-- Realiza un producto cartesiano entre las tablas departamentos y empleados
select * from departamentos, empleados;


-- A partir del ejercicio anterior obtén sólo los registros válidos, es decir, 
-- aquellos donde el empleado sólo está relacionado con el departamento al que pertenece.
select * from departamentos, empleados where empleados.departamento_id = empleados.id;


-- Realiza un producto cartesiano entre las tablas departamento y proyecto 
select * from departamentos, proyectos;

-- A partir del ejercicio anterior obtener los registros válidos, es decir, 
-- relacionar proyecto sólo con el departamento que lo está realizando.
select * from departamentos, proyectos where proyectos.departamento_id = departamentos.id;


-- Realiza un producto cartesiano entre las tablas empleados, departamentos y proyecto
select * from empleados, departamentos, proyectos;

-- Realizar el producto cartesiano entre las tablas Empleado y Departamento 
-- en la que sólo se relacione a cada empleado con el departamento al que pertenece y
-- además sólo mostrará aquellos cuyo Salario sea superior a 30000. 
SELECT 
    *
FROM
    empleados,
    departamentos
WHERE
    empleados.departamento_id = departamentos.id and empleados.salario > 30000;




# 2. Consultas multitablas (INNER JOIN)
# Realizar los mismos ejercicios anteriores pero usando la cláusula INNER JOIN.

-- Realiza un producto cartesiano entre las tablas departamentos y empleados
select * from departamentos, empleados;


-- A partir del ejercicio anterior obtén sólo los registros válidos, es decir, 
-- aquellos donde el empleado sólo está relacionado con el departamento al que pertenece.
select * from departamentos inner join empleados on empleados.departamento_id = empleados.id;


-- Realiza un producto cartesiano entre las tablas departamento y proyecto 
select * from departamentos, proyectos;

-- A partir del ejercicio anterior obtener los registros válidos, es decir, 
-- relacionar proyecto sólo con el departamento que lo está realizando.
select * from departamentos inner join proyectos on proyectos.departamento_id = departamentos.id;


-- Realiza un producto cartesiano entre las tablas empleados, departamentos y proyecto
select * from empleados, departamentos, proyectos;

-- Realizar el producto cartesiano entre las tablas Empleado y Departamento 
-- en la que sólo se relacione a cada empleado con el departamento al que pertenece y
-- además sólo mostrará aquellos cuyo Salario sea superior a 30000. 
SELECT 
    *
FROM
    empleados inner join
    departamentos
on
    empleados.departamento_id = departamentos.id and empleados.salario > 30000;

